import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
