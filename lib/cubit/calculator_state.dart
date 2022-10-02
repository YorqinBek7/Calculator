part of 'calculator_cubit.dart';

@immutable
abstract class CalculatorState {
  const CalculatorState();
}

class CalculatorInitial extends CalculatorState {}

class CalculusState extends CalculatorState {}

class CalculusErrorState extends CalculatorState {}
