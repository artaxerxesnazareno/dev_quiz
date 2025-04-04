import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widget/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão 04', style: AppTextStyles.body),
              Text('de 10', style: AppTextStyles.body),
            ],
          ),
          ProgressIndicatorWidget(value: .7),
        ],
      ),
    );
  }
}
