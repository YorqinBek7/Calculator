import 'package:calculator/cubit/calculator_cubit.dart';
import 'package:calculator/presentation/calculus_page/methods.dart';
import 'package:calculator/presentation/calculus_page/widgets/buttons.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as print;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllButtons extends StatefulWidget {
  const AllButtons({
    super.key,
    required this.globalKey,
    required this.stringBuffer,
  });
  final StringBuffer stringBuffer;
  final GlobalKey globalKey;

  @override
  State<AllButtons> createState() => _AllButtonsState();
}

class _AllButtonsState extends State<AllButtons> {
  @override
  Widget build(BuildContext context) {
    var readCubit = context.read<CalculatorCubit>();
    var watchCubit = context.watch<CalculatorCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Buttons(
              buttonColor: CalculatorColor.C_ff5959,
              text: "C",
              onTap: () {
                watchCubit.isSmaller = false;
                widget.stringBuffer.clear();
                watchCubit.isTappedResult = false;
                watchCubit.calculusText = "";
                watchCubit.resultText = "";
                context.read<CalculatorCubit>().calculusNumbers();
              },
              textColor: CalculatorColor.C_343434,
            ),
            Buttons(
              buttonColor: CalculatorColor.C_343434,
              text: "()",
              onTap: () {
                String text = "(${widget.stringBuffer})";
                widget.stringBuffer.clear();
                widget.stringBuffer.write(text);
                watchCubit.calculusText = widget.stringBuffer.toString();
                context.read<CalculatorCubit>().calculusNumbers();
              },
              textColor: CalculatorColor.C_66ff7f,
            ),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "%",
                onTap: () {
                  writeOperationMethod(
                    text: '%',
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    calculusText: readCubit.calculusText,
                    isTappedResult: readCubit.isTappedResult,
                  );
                },
                textColor: CalculatorColor.C_66ff7f),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "/",
                onTap: () {
                  writeOperationMethod(
                    text: '/',
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    calculusText: readCubit.calculusText,
                    isTappedResult: readCubit.isTappedResult,
                  );
                },
                textColor: CalculatorColor.C_66ff7f)
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "7",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '7',
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "8",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '8',
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "9",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '9',
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "*",
                onTap: () {
                  writeOperationMethod(
                    isTappedResult: watchCubit.isTappedResult,
                    text: '*',
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    calculusText: readCubit.calculusText,
                  );
                  context.read<CalculatorCubit>().calculusNumbers();
                },
                textColor: CalculatorColor.C_ffffff)
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "4",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '4',
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "5",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '5',
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
              buttonColor: CalculatorColor.C_343434,
              text: "6",
              onTap: () {
                writeNumberMethod(
                  stringBuffer: widget.stringBuffer,
                  watchCubit: watchCubit,
                  context: context,
                  globalKey: widget.globalKey,
                  text: '6',
                );
              },
              textColor: CalculatorColor.C_ffffff,
            ),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "-",
                onTap: () {
                  writeOperationMethod(
                    text: '-',
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    calculusText: readCubit.calculusText,
                    isTappedResult: readCubit.isTappedResult,
                  );
                },
                textColor: CalculatorColor.C_ffffff)
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "1",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '1',
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "2",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '2',
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "3",
                onTap: () {
                  writeNumberMethod(
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    globalKey: widget.globalKey,
                    text: '3',
                  );
                  print.log(readCubit.isTappedResult.toString());
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "+",
                onTap: () {
                  writeOperationMethod(
                    text: '+',
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    calculusText: readCubit.calculusText,
                    isTappedResult: readCubit.isTappedResult,
                  );
                },
                textColor: CalculatorColor.C_ffffff)
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: "+/-",
                onTap: () {},
                textColor: CalculatorColor.C_ffffff),
            Buttons(
              buttonColor: CalculatorColor.C_343434,
              text: "0",
              onTap: () {
                writeNumberMethod(
                  stringBuffer: widget.stringBuffer,
                  watchCubit: watchCubit,
                  context: context,
                  globalKey: widget.globalKey,
                  text: '0',
                );
              },
              textColor: CalculatorColor.C_ffffff,
            ),
            Buttons(
                buttonColor: CalculatorColor.C_343434,
                text: ".",
                onTap: () {
                  writeOperationMethod(
                    text: '.',
                    stringBuffer: widget.stringBuffer,
                    watchCubit: watchCubit,
                    context: context,
                    calculusText: readCubit.calculusText,
                    isTappedResult: readCubit.isTappedResult,
                  );
                },
                textColor: CalculatorColor.C_ffffff),
            Buttons(
                buttonColor: CalculatorColor.C_66ff7f,
                text: "=",
                onTap: () {
                  if (watchCubit.calculusText.isNotEmpty) {
                    try {
                      widget.stringBuffer.clear();
                      watchCubit.isTappedResult = true;
                      context.read<CalculatorCubit>().calculusNumbers();
                    } catch (e) {
                      print.log(e.toString());
                    }
                  }
                },
                textColor: CalculatorColor.C_ffffff)
          ],
        ),
      ],
    );
  }
}
