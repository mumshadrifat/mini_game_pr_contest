import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_game_pr_contest/app/utils/dimens.dart';

import '../utils/colors.dart';
import 'custom_text.dart';
class CustomColorButton extends StatelessWidget {

  String? text;
  bool? borderColor;
  CustomColorButton({Key? key,this.text="button name", this.borderColor=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(
          left: Dimension.width20, right: Dimension.width20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color:borderColor==true?Colors.yellow:Colors.grey,width: 15),
      ),
      child: Center(
          child: CustomText(
              text: text!,
              fontWeight: FontWeight.bold,
              color: AppColors.purple,
              size: Dimension.largeFont)),
    );
  }
}