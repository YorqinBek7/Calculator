import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());
  String calculusText = "";
  String resultText = "";
  double resultTextwidth = 0.0;
  bool isSmaller = false;
  bool isTappedResult = false;
  double firstResultSize = 48;
  bool isVisible = false;
  String errorText = "";
  bool isError = false;
  void calculusNumbers() {
    emit(CalculusState());
  }

  void calculusError() {
    emit(CalculusErrorState());
  }
}
