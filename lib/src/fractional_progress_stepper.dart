import 'package:flutter/material.dart';

/// A widget that displays a stepper-like progress indicator with custom
/// configurations for appearance and behavior.
class FractionalProgressStepper extends StatelessWidget {
  /// [steps] is the list of step labels to be displayed below each step circle.
  final List<String> steps;

  /// [progress] is the current progress represented as a double.
  /// For example, a value of 1.5 would mean step 1 is fully active,
  /// and step 2 is partially active.
  final double progress;

  /// [padding] is the horizontal padding applied on either side of the stepper.
  /// Must be at least 24.0 (default is [EdgeInsets.zero]).
  final EdgeInsets padding;

  /// Width of the line connecting each step indicator.
  final double lineWidth;

  /// Font size of the step labels.
  final double fontSize;

  /// [stepSpacing] is the vertical spacing between each step circle and its label text (default is 4.0).
  final double stepSpacing;

  /// [activeColor] is the color used for active (completed or current) steps (default is [Colors.blue]).
  final Color activeColor;

  /// [inactiveColor] is the color used for inactive (upcoming) steps (default is [Colors.grey]).
  final Color inactiveColor;

  /// [textColor] is the color of the step labels (default is [Colors.black]).
  final Color textColor;
   FractionalProgressStepper({
    super.key,
    required this.steps,
    required this.progress,
    this.padding = EdgeInsets.zero,
    this.stepSpacing = 4.0,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.textColor = Colors.black,
    this.lineWidth = 3,
    this.fontSize = 12
  }) : assert(steps.isNotEmpty, 'Steps cannot be empty');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          // Row of step circles and progress lines, wrapped in padding.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(steps.length, (index) {
                bool isActive = progress >= index; // Determines if the step is active
                bool isLast = index == steps.length - 1; // Checks if this is the last step

                // If it's the last step, only display the circle; otherwise, display circle and progress line.
                return isLast
                    ? _stepCircle(isActive)
                    : Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _stepCircle(isActive), // Step circle indicator
                          if (!isLast)
                            _stepProgress(progress: progress, index: index), // Progress line
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: stepSpacing), // Vertical spacing between step circles and text labels
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(steps.length, (index) {
              return Flexible(
                child: SizedBox(
                  width: 55,
                  // Display the label text for each step
                  child: Text(
                    steps[index],
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor, fontSize: fontSize),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// Creates a circular step indicator with a filled color based on the
  /// [isActive] status.
  Widget _stepCircle(bool isActive) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4), // Padding inside the circle container
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor, // Background color of circle based on step state
        shape: BoxShape.circle,
      ),
      child: const CircleAvatar(
        radius: 4, // Radius of the step circle
        backgroundColor: Colors.white, // Inner circle color
      ),
    );
  }

  /// Creates a progress line connecting each step circle with the next.
  /// The line's progress is calculated based on the [progress] value and [index].
  Widget _stepProgress({required double progress, required int index}) {
    return Expanded(
      child: LinearProgressIndicator(
        minHeight: lineWidth, // Thickness of the progress line
        value: (progress - index).clamp(0, 1), // Determines the line fill based on progress
        backgroundColor: inactiveColor, // Background color of progress line
        valueColor: AlwaysStoppedAnimation<Color>(activeColor), // Active color of progress line
      ),
    );
  }
}
