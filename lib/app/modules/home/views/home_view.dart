import 'package:flutter/material.dart';


import 'package:get/get.dart';

import 'package:mini_game_pr_contest/app/common_widget/custom_text.dart';
import 'package:mini_game_pr_contest/app/modules/question_screen/controllers/question_screen_controller.dart';


import '../../../data/local_db.dart';
import '../../../model/local_model/best_score.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  //GetStorage box=GetStorage();
  var test;
var tapped=false.obs;
   HomeView({Key? key}) : super(key: key);
QuestionScreenController questionScreenController=Get.put(QuestionScreenController());
  @override
  Widget build(BuildContext context) {
    questionScreenController.loadQuestionLit();

    controller.dataInsert();
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: AppColors.purple,
        padding:
            EdgeInsets.only(left: Dimension.width20, right: Dimension.width20),
        child: Column(
          children: [
            SizedBox(
              height: Dimension.height100 +
                  (Dimension.height30 * 2) +
                  Dimension.height10,
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                  top: Dimension.height10, bottom: Dimension.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //SizedBox(height: Dimension.height30*20+Dimension.height10,),

                  Image.asset(
                    "assets/image/prlogo.png",
                    height: Dimension.height100 + Dimension.height30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Programming Hero",
                    style: TextStyle(
                        fontSize: Dimension.largeFont, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Text(
                    "Quiz",
                    style: TextStyle(
                        fontSize: Dimension.extraLargeFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: Dimension.height45 + Dimension.height15,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: "High Score",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: Dimension.mediumFont),
                  Obx(() => CustomText(
                    text: "${controller.maxScore.value} points",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: Dimension.mediumFont,
                  ),)
                ],
              ),
            ),
             // Obx(() => tapped==true?CircularPercentIndicator(
             //   radius: 130.0,
             //   animation: true,
             //   animationDuration: 12000,
             //   lineWidth: 15.0,
             //   percent: 0.4,
             //   center: new Text(
             //     "40 hours",
             //     style:
             //     new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
             //   ),
             //   circularStrokeCap: CircularStrokeCap.butt,
             //   backgroundColor: Colors.yellow,
             //   progressColor: Colors.red,
             // ):Container()),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                tapped.value=true;
              //  EasyLoading.show();
                Get.toNamed(Routes.QUESTION_SCREEN);
              ///  EasyLoading.dismiss();


              },
              child: Container(
                  padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: Dimension.height10,
                      bottom: Dimension.height10),
                  height: Dimension.height45 + Dimension.height15,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimension.width20, right: Dimension.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: CustomText(
                            text: "Start",
                            fontWeight: FontWeight.bold,
                            color: AppColors.purple,
                            size: Dimension.largeFont)),
                  )),
            )
          ],
        ),
      )),
    );
  }

}
