import 'package:dev_quiz/challenge/widget/awnser/awnser_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          AwnserWidget(
            isRight: false,
            isSelected: true,
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
          ),
          AwnserWidget(
            isRight: true,
            isSelected: true,
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
          ),
          AwnserWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
          ),
          AwnserWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
          ),
        ],
      ),
    );
  }
}
