import 'package:flutter/material.dart';
import 'package:fractional_progress_stepper/fractional_progress_stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fractional Progress Stepper Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FractionProgressStepperExample(
        title: 'Fractional Progress Stepper Demo',
      ),
    );
  }
}

class FractionProgressStepperExample extends StatelessWidget {
  final String title;

  const FractionProgressStepperExample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FractionalProgressStepper(
          steps: const ['Step 0', 'Step 1', 'Step 2', 'Step 3', 'Step 4'],
          progress: 1.5,
          stepSpacing: 4,
          lineWidth: 3,
          activeColor: Colors.deepOrange,
          inactiveColor: Colors.grey,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
