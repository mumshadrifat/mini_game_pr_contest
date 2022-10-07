import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_game_pr_contest/app/common_widget/custom_text.dart';
import 'package:mini_game_pr_contest/app/utils/colors.dart';
import 'package:mini_game_pr_contest/app/utils/dimens.dart';

import '../../../common_widget/answer_button.dart';
import '../controllers/question_screen_controller.dart';

class QuestionScreenView extends GetView<QuestionScreenController> {
  String defaulImageAdd =
      "https://image.shutterstock.com/image-vector/no-user-profile-picture-hand-260nw-99335579.jpg";
  var answerList = <String?>[].obs;
  RxList<String> randomList = <String>[].obs;
  final _random = new Random();
  var element;
  List<int> r=[0,1,2,3];
  var n;
  RxInt firstIndex=0.obs;
  RxInt secondIndex=0.obs;
  RxInt thirdIndex=0.obs;
  RxInt fourthIndex=0.obs;
  RxList<int> numberList=<int>[].obs;
  QuestionScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller.loadQuestionLit();
    var item = controller.questionList[controller.counter.value];
    answerList.value.add(item.answers?.a);
    answerList.value.add(item.answers?.b);
    answerList.value.add(item.answers?.c);
    answerList.value.add(item.answers?.d);
   // addInRandomList();
   // newRandFunc();

    //For uniquly randomization

    for(int i=0;i<3;i++){
      n = _random.nextInt(r.length-1);
      print(n);


      numberList.value.add(r[n]);
      r.removeAt(n);

    }
    numberList.add(r[0]);
    print(numberList);

    firstIndex.value=numberList[0];
    secondIndex.value=numberList[1];
    thirdIndex.value=numberList[2];
    fourthIndex.value=numberList[3];



    // var randomItem = (list.toList()..shuffle()).first;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  //SizedBox(height: 60),
                  Container(
                      padding: EdgeInsets.only(
                          left: Dimension.width20 + 10,
                          right: Dimension.width20 + 10,
                          top: Dimension.height10,
                          bottom: Dimension.height10),
                      height: 70,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text:
                                  "Question ${controller.counter.value}/${controller.questionList.length}",
                              fontWeight: FontWeight.bold,
                              color: AppColors.purple,
                            ),
                            CustomText(
                              text: "Score:${controller.currentScore}",
                              fontWeight: FontWeight.bold,
                              color: AppColors.purple,
                            ),
                          ],
                        ),
                      )),
                  controller.questionList.length > 0
                      ? Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    CustomText(
                                      text:
                                          "${controller.questionList[controller.counter.value].score.toString()} points",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.purple,
                                      size: Dimension.mediumFont,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 200,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(controller
                                                        .questionList[controller
                                                            .counter.value]
                                                        .questionImageUrl !=
                                                    null
                                                ? "${controller.questionList[controller.counter.value].questionImageUrl}"
                                                : "${defaulImageAdd}"),
                                            fit: BoxFit.fitWidth),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text:
                                          "${controller.questionList[controller.counter.value].question}",
                                      color: AppColors.purple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 50,
                                margin: EdgeInsets.only(
                                    left: Dimension.width20,
                                    right: Dimension.width20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: CustomText(
                                        text: "${answerList[firstIndex.value]}",
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.purple,
                                        size: Dimension.largeFont)),
                              ),
                              SizedBox(height: 10),
                              CustomButton(text: "${answerList[secondIndex.value]}"),
                              SizedBox(height: 10),
                              CustomButton(text: "${answerList[thirdIndex.value]}"),
                              SizedBox(height: 10),
                              CustomButton(text: "${answerList[fourthIndex.value]}"),
                            ],
                          ),
                        )
                      : Container(),
                ],
              )),
        ),
      ),
    );
  }


  void uniqueRandFunction(){


  }

 // newRandFunc(){
 //
 //   Random random = new Random();
 //   while(numberList.length<5){
 //     int random_number = random.nextInt(4);
 //     if (!numberList.value.contains(random_number)){
 //       numberList.value.add(random_number);
 //     }
 //   }
 //   print(numberList.toString());
 // }
 //  bool doublechecker() {
 //    for (int i = 0; i < randomList.length; i++) {
 //      if (randomList[i] == element) {
 //        return false;
 //      } else {
 //        return true;
 //      }
 //    }
 //    return true;
 //  }

  // void addInRandList() {
  //   if (doublechecker()) {
  //     randomList.add(element!);
  //   } else {
  //     element = answerList[_random.nextInt(answerList.length)];
  //     addInRandomList();
  //   }
  // }

  // void addInRandomList() {
  //   for (int i = 0; i < 4; i++) {
  //     element = answerList[_random.nextInt(4)];
  //     print(element);
  //
  //     if (randomList.length == 0) {
  //       randomList.add(element!);
  //     }
  //     if (randomList.length >= 1) {
  //       addInRandList();
  //     }
  //   }
  // }
}
