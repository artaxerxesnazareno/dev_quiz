import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key, required this.questions});

  final List<QuestionModel> questions;

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              Expanded(
                child: ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder:
                      (context, value, child) => QuestionIndicatorWidget(
                        currentPage: controller.currentPage,
                        lenght: widget.questions.length,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children:
            widget.questions
                .map((e) => QuizWidget(questionModel: e, onChanges: nextPage))
                .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder:
                (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 7,
                  children: [
                    if (value < widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.white(
                          label: 'Pular',
                          onTap: nextPage,
                        ),
                      ),
                    if (value == widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.green(
                          label: 'Confirmar',
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
