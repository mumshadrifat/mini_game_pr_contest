import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_game_pr_contest/app/common_widget/custom_color_button.dart';
import 'package:mini_game_pr_contest/app/common_widget/custom_text.dart';
import 'package:mini_game_pr_contest/app/model/response_model/question_response.dart';
import 'package:mini_game_pr_contest/app/utils/colors.dart';
import 'package:mini_game_pr_contest/app/utils/dimens.dart';

import '../../../common_widget/answer_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/question_screen_controller.dart';

class QuestionScreenView extends GetView<QuestionScreenController> {
  var n;   //numberRandom Number
  RxInt flag=0.obs;

  final _random = new Random();
  //var element;

  List<int> r=[0,1,2,3];
  RxInt firstIndex=0.obs;
  RxInt secondIndex=0.obs;
  RxInt thirdIndex=0.obs;
  RxInt fourthIndex=0.obs;
  RxBool firstIndexColor=false.obs;
  RxBool secondIndexColor=false.obs;
  RxBool thirdIndexColor=false.obs;
  RxBool fourtIndexColor=false.obs;
  RxList<int> numberList=<int>[].obs;

  String defaulImageAdd =
      "https://image.shutterstock.com/image-vector/no-user-profile-picture-hand-260nw-99335579.jpg";

  RxList<String> randomList = <String>[].obs;
  RxBool tapped=false.obs;


  QuestionScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    var item = controller.questionList[controller.counter.value];
    controller.loadAnswerList(item);
    print(controller.answerList);


    flag.value=controller.pickCorrectAnswerIndex(item);
    //For uniquly randomization
    uniqueRandFunction();




    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  //SizedBox(height: 60),
                  hedaer(),
                  controller.questionList.length > 0
                      ? Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              mainBody(),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: (){
                                  tapped.value=true;
                                  print(tapped);
                                  setBorderColor(item,0);
                                },
                                child:tapped==false? CustomButton(text: "${controller.answerList[firstIndex.value]}"): Container(
                                  height: 50,
                                  margin: EdgeInsets.only(
                                      left: Dimension.width20,
                                      right: Dimension.width20),
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color:firstIndexColor.isTrue?Colors.green:Colors.red,width: 5),
                                  ),
                                  child: Center(
                                      child: CustomText(
                                          text: "${controller.answerList[firstIndex.value]}",
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.purple,
                                          size: Dimension.largeFont)),
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: (){
                                  tapped.value=true;
                                  print(tapped);
                                  setBorderColor(item,1);

                                },
                                child:tapped==false? CustomButton(text: "${controller.answerList[secondIndex.value]}"):Container(
                                  height: 50,
                                  margin: EdgeInsets.only(
                                      left: Dimension.width20,
                                      right: Dimension.width20),
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color:secondIndexColor.isTrue?Colors.green:Colors.red,width: 5),

                                  ),
                                  child: Center(
                                      child: CustomText(
                                          text: "${controller.answerList[secondIndex.value]}",
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.purple,
                                          size: Dimension.largeFont)),
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                  onTap: (){
                                    tapped.value=true;
                                    print(tapped);
                                    setBorderColor(item,2);

                                  },
                                  child:tapped==false? CustomButton(text: "${controller.answerList[thirdIndex.value]}"):Container(
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        left: Dimension.width20,
                                        right: Dimension.width20),
                                    decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color:thirdIndexColor.isTrue?Colors.green:Colors.red,width: 5),
                                    ),
                                    child: Center(
                                        child: CustomText(
                                            text: "${controller.answerList[thirdIndex.value]}",
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.purple,
                                            size: Dimension.largeFont)),
                                  ),
                              ),
                              SizedBox(height: 10),

                              GestureDetector(
                                  onTap: (){
                                    tapped.value=true;
                                    print(tapped);
                                    setBorderColor(item,3);

                                  },
                                  child:tapped==false? CustomButton(text: "${controller.answerList[fourthIndex.value]}"):Container(
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        left: Dimension.width20,
                                        right: Dimension.width20),
                                    decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(color:fourtIndexColor.isTrue?Colors.green:Colors.red,width: 5),
                                    ),
                                    child: Center(
                                        child: CustomText(
                                            text: "${controller.answerList[fourthIndex.value]}",
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.purple,
                                            size: Dimension.largeFont)),
                                  )
                              ),

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

  Widget hedaer(){
    return Container(
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
                "Question ${controller.counter.value+1}/${controller.questionList.length}",
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
        ));
  }
  Widget mainBody(){
    return Container(
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
    );
  }


  setBorderColor(Questions item,int index) {
   controller.scoreAddChecker=<int>[0,0,0,0].obs;
   print("answer List${controller.answerList}");
   print("${controller.answerList[flag.value]}");
   print("${controller.answerList[firstIndex.value]}");
   //(s.replaceAll(new RegExp(r'[^\w\s]+'),'')
   //String regex = r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';
   //   print(s.replaceAll(RegExp(regex, unicode: true),''));
   //
   //String regex = r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';
   //
   // String regex = r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';
   //
   // var sAnswer=controller.answerList[flag.value]?.replaceAll(RegExp(regex,unicode: true), "");
   // var index1;controller.answerList[firstIndex.value]?.replaceAll(RegExp(regex,unicode: true),"");
   // var index2;controller.answerList[secondIndex.value]?.replaceAll(RegExp(regex,unicode: true),"");
   // var index3;controller.answerList[thirdIndex.value]?.replaceAll(RegExp(regex,unicode: true),"");
   // var index4;controller.answerList[fourthIndex.value]?.replaceAll(RegExp(regex,unicode: true),"");
    if (controller.answerList[flag.value] ==
        controller.answerList[firstIndex.value]) {
      controller.scoreAddChecker[0]=1;
      firstIndexColor.value = true;
      secondIndexColor.value = false;
      thirdIndexColor.value = false;
      fourtIndexColor.value = false;
    }
    else if (controller.answerList[flag.value] ==
        controller.answerList[secondIndex.value]) {
      controller.scoreAddChecker[1]=1;
      firstIndexColor.value = false;
      secondIndexColor.value = true;
      thirdIndexColor.value = false;
      fourtIndexColor.value = false;
    }
    else if (controller.answerList[flag.value] ==
        controller.answerList[thirdIndex.value]) {
      controller.scoreAddChecker[2]=1;
      firstIndexColor.value = false;
      secondIndexColor.value = false;
      thirdIndexColor.value = true;
      fourtIndexColor.value = false;
    }

    else if (controller.answerList[flag.value] ==
        controller.answerList[thirdIndex.value]) {
      controller.scoreAddChecker[3]=1;
      firstIndexColor.value = false;
      secondIndexColor.value = false;
      thirdIndexColor.value = false;
      fourtIndexColor.value = true;
    }
    print("---checker array--${controller.scoreAddChecker}");

    print("---correct index--${scoreAddtion(item)}");
    if(controller.counter==controller.questionList.length-1){
      controller.setBestScore();
     // controller.homeController.dataInsert();
      Get.toNamed(Routes.HOME);
    }
    else{
      if( scoreAddtion(item)==index){
        controller.currentScore=controller.currentScore+controller.questionList[controller.counter.value].score!;
      }
      else{
        Get.snackbar("Wrong", "Be conscious");
      }
      Timer(Duration(seconds: 2), () {
        print("Yeah, this line is printed after 3 second");
        tapped.value = false;
        controller.counter = controller.counter + 1;


        controller.loadAnswerList(
            controller.questionList[controller.counter.value]);
        flag.value = controller.pickCorrectAnswerIndex(
            controller.questionList[controller.counter.value]);
        print("item no---${controller.counter}");
        print("next correct answer index${flag}");
      });
    }

  }
  int scoreAddtion(Questions item){
 for(int i=0;i<4;i++){
   if(controller.scoreAddChecker[i]==1){
    return i;
   }

 }
 return 0;

  }




  void uniqueRandFunction(){
    for(int i=0;i<controller.answerList.length-1;i++){
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
