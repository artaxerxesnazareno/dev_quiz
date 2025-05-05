import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widget/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.lenght,
  });
  final int currentPage;
  final int lenght;
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
              Text('Questão $currentPage', style: AppTextStyles.body),
              Text('de $lenght', style: AppTextStyles.body),
            ],
          ),
          ProgressIndicatorWidget(value: currentPage / lenght),
        ],
      ),
    );
  }
}
