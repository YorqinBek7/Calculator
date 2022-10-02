import 'package:calculator/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:function_tree/function_tree.dart';
import 'dart:developer' as print;

void writeNumberMethod({
  required String text,
  required StringBuffer stringBuffer,
  required CalculatorCubit watchCubit,
  required BuildContext context,
  required GlobalKey globalKey,
}) {
  try {
    context.read<CalculatorCubit>().isTappedResult = false;
    stringBuffer.write(text);
    watchCubit.resultTextwidth = globalKey.currentContext!.size!.width;
    if (watchCubit.resultTextwidth >=
        MediaQuery.of(context).size.width - 70.w) {
      watchCubit.isSmaller = true;
    }
    if (stringBuffer.length > 15) {
      return;
    }
    watchCubit.calculusText = stringBuffer.toString();
    watchCubit.resultText = watchCubit.calculusText.interpret().toString();
    context.read<CalculatorCubit>().calculusNumbers();
  } catch (error) {
    context.read<CalculatorCubit>().errorText = "Error";
    context.read<CalculatorCubit>().calculusError();
  }
}

void writeOperationMethod({
  required String text,
  required StringBuffer stringBuffer,
  required CalculatorCubit watchCubit,
  required BuildContext context,
  required String calculusText,
  required bool isTappedResult,
}) {
  context.read<CalculatorCubit>().isTappedResult = false;
  if (calculusText.isNotEmpty) {
    if (calculusText[calculusText.length - 1] != text) {
      stringBuffer.write(text);
      watchCubit.calculusText = stringBuffer.toString();
      context.read<CalculatorCubit>().calculusNumbers();
    } else {
      print.log("bir xil");
    }
  }
}

Stream<bool> visibleCursor({required bool isVisible}) async* {
  while (true) {
    await Future.delayed(const Duration(milliseconds: 500));
    yield isVisible = !isVisible;
  }
}
