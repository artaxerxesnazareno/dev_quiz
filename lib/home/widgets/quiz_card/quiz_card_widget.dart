import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widget/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  const QuizCardWidget({
    super.key,
    required this.title,
    required this.completed,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          SizedBox(height: 40, width: 40, child: Image.asset(AppImages.blocks)),
          Text(title, style: AppTextStyles.heading15),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(completed, style: AppTextStyles.body11),
              ),
              Expanded(flex: 4, child: ProgressIndicatorWidget(value: percent)),
            ],
          ),
        ],
      ),
    );
  }
}
