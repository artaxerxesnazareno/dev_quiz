// USER
// QUIZZES

import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/repository/home_repository.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  ValueNotifier<HomeState> homeState = ValueNotifier<HomeState>(
    HomeState.empty,
  );
  HomeState state = HomeState.empty;
  final repository = HomeRepository();
  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    try {
      user = await repository.getUser();
      state = HomeState.sucess;
    } catch (e) {
      state = HomeState.error;
    }
  }

  Future<void> getQuizzes() async {
    state = HomeState.loading;
    try {
      quizzes = await repository.getQuizzes();
      state = HomeState.sucess;
    } catch (e) {
      state = HomeState.error;
    }
  }
}
