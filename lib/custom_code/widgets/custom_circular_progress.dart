// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class CustomCircularProgress extends StatefulWidget {
  const CustomCircularProgress({
    super.key,
    this.width,
    this.height,
    required this.progressValue,
    required this.size,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
    required this.showPercentage,
  });

  final double? width;
  final double? height;
  final double progressValue;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final bool showPercentage;

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> {
  late ValueNotifier<double> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(0.0); // Start from 0
    Future.delayed(const Duration(seconds: 1), () {
      valueNotifier.value = widget.progressValue;
    });
  }

  @override
  void didUpdateWidget(CustomCircularProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressValue != widget.progressValue) {
      Future.delayed(const Duration(seconds: 1), () {
        valueNotifier.value = widget.progressValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: SimpleCircularProgressBar(
        valueNotifier: valueNotifier,
        size: widget.size,
        progressStrokeWidth: widget.strokeWidth,
        backStrokeWidth: widget.strokeWidth,
        progressColors: [widget.progressColor],
        backColor: widget.backgroundColor
            .withOpacity(0.2), // Made background more transparent
        mergeMode: true, // Added merge mode for smoother appearance
        animationDuration: 1,
        startAngle: 0, // Start from the top
        onGetText: widget.showPercentage
            ? (value) => Text(
                  '${value.toInt()}%',
                  style: FlutterFlowTheme.of(context).titleSmall.copyWith(
                        color: widget.progressColor,
                      ),
                  textAlign: TextAlign.center,
                )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }
}
