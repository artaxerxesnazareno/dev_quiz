import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
    : super(
        preferredSize: Size.fromHeight(250),
        child: Container(
          height: 250,
          child: Stack(
            children: [
              Container(
                height: 161,
                decoration: BoxDecoration(gradient: AppGradients.linear),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Olá, ',
                        style: AppTextStyles.title,
                        children: [
                          TextSpan(
                            text: user.name,
                            style: AppTextStyles.titleBold,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.photoUrl),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              Align(alignment: Alignment(0, 1.25), child: ScoreCardWidget()),
            ],
          ),
        ),
      );
}
