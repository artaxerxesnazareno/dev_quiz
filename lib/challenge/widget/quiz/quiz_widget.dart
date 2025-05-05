import 'package:dev_quiz/challenge/widget/awnser/awnser_widget.dart';
import 'package:dev_quiz/shared/models/awnser_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    super.key,
    required this.questionModel,
    required this.onChanges,
  });

  final VoidCallback onChanges;
  final QuestionModel questionModel;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.questionModel.awnsers[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 64),

            Text(widget.questionModel.title, style: AppTextStyles.heading),
            SizedBox(height: 24),
            for (var i = 0; i < widget.questionModel.awnsers.length; i++)
              AwnserWidget(
                awnser: awnser(i),
                isSelected: indexSelected == i,
                disable: indexSelected != -1,
                onTap: () {
                  indexSelected = i;

                  setState(() {});
                  Future.delayed(
                    Duration(seconds: 1),
                  ).then((value) => widget.onChanges());
                },
              ),
          ],
        ),
      ),
    );
  }
}
