
# Fractional Progress Stepper

Directly conveys support for fractional (non-integer) steps.


## Installation

In the pubspec.yaml of your flutter project, add the following dependency:

```bash
dependencies:
  fractional_progress_stepper: <latest_version>
```

or 

```bash
dependencies:
  fractional_progress_stepper:
    git: 
      url: git://github.com/pritom-shajed/fractional_progress_stepper.git
      ref: master
```

In your library add the following import:

```bash
import 'package:fractional_progress_stepper/fractional_progress_stepper.dart';
```

Then, run `flutter pub get` in your terminal to install the package.


## Features

- Displays a linear progress indicator with steps.
- Option to partially or fully fill steps based on a floating-point progress.
- Configurable step labels and appearance, including colors, line thickness, padding, spacing, font size.

#### Example:

![fractionalProgressStepper](https://github.com/Pritom-Shajed/showcase/blob/master/fractional_progress_stepper/fractional_progress_stepper.gif?raw=true)

```dart
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
```

## Built with

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

![Love](https://ForTheBadge.com/images/badges/built-with-love.svg)