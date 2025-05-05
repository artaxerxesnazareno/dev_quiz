import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();

    controller.homeState.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(user: controller.user!),
      body:
          controller.state == HomeState.sucess
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 24,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LevelButtonWidget(label: 'Fácil'),
                        LevelButtonWidget(label: 'Médio'),
                        LevelButtonWidget(label: 'Difícil'),
                        LevelButtonWidget(label: 'Perito'),
                      ],
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children:
                            controller.quizzes!
                                .map(
                                  (e) => QuizCardWidget(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => ChallengePage(
                                                questions: e.questions,
                                              ),
                                        ),
                                      );
                                    },
                                    title: e.title,
                                    percent:
                                        e.questionAnswered / e.questions.length,
                                    completed:
                                        "${e.questionAnswered}/${e.questions.length}",
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ],
                ),
              )
              : Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.darkGreen,
                  ),
                ),
              ),
    );
  }
}
