import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
    : super(
        preferredSize: Size.fromHeight(250),
        child: Container(
          height: 250,
          decoration: BoxDecoration(gradient: AppGradients.linear),
          child: Padding(
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
                        text: 'Artaxerxes',
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
                      image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/105333397?v=4',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
