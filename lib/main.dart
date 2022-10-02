import 'package:calculator/cubit/calculator_cubit.dart';
import 'package:calculator/presentation/calculus_page/calculus_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(393, 873),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: BlocProvider(
                create: (context) => CalculatorCubit(),
                child: const CalculusScreen(),
              ),
            ));
  }
}
