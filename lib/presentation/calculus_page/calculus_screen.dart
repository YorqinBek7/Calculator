import 'package:calculator/cubit/calculator_cubit.dart';
import 'package:calculator/presentation/calculus_page/methods.dart';
import 'package:calculator/presentation/calculus_page/widgets/all_buttons.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculusScreen extends StatefulWidget {
  const CalculusScreen({super.key});

  @override
  State<CalculusScreen> createState() => _CalculusScreenState();
}

class _CalculusScreenState extends State<CalculusScreen> {
  StringBuffer stringBuffer = StringBuffer();
  final GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var watchCubit = context.watch<CalculatorCubit>();
    return Scaffold(
      backgroundColor: CalculatorColor.C_151515,
      appBar: AppBar(
        backgroundColor: CalculatorColor.C_151515,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          BlocBuilder<CalculatorCubit, CalculatorState>(
            builder: (BuildContext context, CalculatorState state) {
              if (state is CalculatorInitial) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    StreamBuilder(
                      stream: visibleCursor(isVisible: false),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          bool isVisible = snapshot.data!;
                          return Column(
                            children: [
                              Text("|",
                                  key: _globalKey,
                                  style: TextStyle(
                                    color: Colors.transparent,
                                    fontSize: 48.sp,
                                  )),
                              Visibility(
                                visible: isVisible,
                                child: Text(
                                  "|",
                                  style: TextStyle(
                                    color: CalculatorColor.C_ffffff,
                                    fontSize: 48.sp,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                );
              } else if (state is CalculusState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IntrinsicWidth(
                      key: _globalKey,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 500),
                        style: TextStyle(
                          color: watchCubit.isTappedResult
                              ? CalculatorColor.C_808080
                              : CalculatorColor.C_ffffff,
                          fontSize: watchCubit.isTappedResult
                              ? 30.sp
                              : watchCubit.isSmaller == false
                                  ? 48.sp
                                  : 30.sp,
                        ),
                        child: Row(
                          children: [
                            Text(watchCubit.calculusText),
                            Visibility(
                              visible: !watchCubit.isTappedResult,
                              child: StreamBuilder(
                                stream: visibleCursor(isVisible: false),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    bool isVisible = snapshot.data!;
                                    return Visibility(
                                      visible: isVisible,
                                      child: Text("|",
                                          style: TextStyle(
                                              color: CalculatorColor.C_ffffff,
                                              fontSize: 48.sp)),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<CalculatorCubit, CalculatorState>(
                builder: (BuildContext context, state) {
                  if (state is CalculusState) {
                    return AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(
                          color: watchCubit.isTappedResult
                              ? CalculatorColor.C_ffffff
                              : CalculatorColor.C_808080,
                          fontSize: watchCubit.isTappedResult ? 65.sp : 30.sp),
                      child: Text(watchCubit.resultText.length < 10
                          ? watchCubit.resultText
                          : watchCubit.resultText.substring(0, 10)),
                    );
                  } else if (state is CalculusErrorState) {
                    return AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 500),
                        style: TextStyle(
                            color: watchCubit.isTappedResult
                                ? CalculatorColor.C_ffffff
                                : CalculatorColor.C_808080,
                            fontSize:
                                watchCubit.isTappedResult ? 65.sp : 30.sp),
                        child: Text(watchCubit.errorText));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  if (watchCubit.calculusText.isNotEmpty) {
                    stringBuffer.clear();
                    stringBuffer.write(watchCubit.calculusText
                        .substring(0, watchCubit.calculusText.length - 1));
                    watchCubit.resultText = "";
                    watchCubit.calculusText = stringBuffer.toString();
                    context.read<CalculatorCubit>().calculusNumbers();
                  } else {}
                },
                icon: Icon(
                  Icons.backspace,
                  color: CalculatorColor.C_ffffff,
                  size: 30.r,
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0.r),
            child: AllButtons(
              globalKey: _globalKey,
              stringBuffer: stringBuffer,
            ),
          ),
        ],
      ),
    );
  }
}
