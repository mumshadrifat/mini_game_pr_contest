import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mini_game_pr_contest/app/data/question_repo.dart';

import '../../../model/response_model/question_response.dart';

class QuestionScreenController extends GetxController {
  //TODO: Implement QuestionScreenController
  RxList<Questions> questionList=<Questions>[].obs;
  final count = 0.obs;
   RxInt counter=0.obs;
   RxList<int> scoreAddChecker=<int>[0,0,0,0].obs;
  RxInt currentScore=0.obs;
  var answerList = <String?>[].obs;
  final box = GetStorage();
  RxInt bestScore=0.obs;



  int pickCorrectAnswerIndex(Questions item){
    if(item.correctAnswer=="A"){
      print("A");
      return 0;
    }
    else if(item.correctAnswer=="B"){
      print("B");

      return 1;
    }
    else if(item.correctAnswer=="C"){
      print("C");

      return 2;

    }
    else if(item.correctAnswer=="D"){
      print("D");

      return 3;
    }
    else{
      return 0;
    }

  }
   void loadAnswerList(Questions item){
     answerList.value=[];
     answerList.value.add(item.answers?.a?.replaceAll("&", "+"));
     answerList.value.add(item.answers?.b?.replaceAll("&", "+"));
     answerList.value.add(item.answers?.c?.replaceAll("&", "+"));
     answerList.value.add(item.answers?.d?.replaceAll("&", "+"));
   }

  @override
  void onInit() {
    super.onInit();
    writeData();





 //   loadQuestionLit();
  }
  writeData(){
    if(box.read("bestScore")==null){
    box.write("bestScore", bestScore);
    }
  }


  setBestScore(){
    print(currentScore.value.toString().compareTo(box.read("bestScore").toString()));
  if(currentScore.value.toString().compareTo(box.read("bestScore").toString())!=0){
    print("if");
  box.write("bestScore", currentScore);
 }
  else{
    print("else");
    box.write("bestScore", bestScore);
  }
  }

  loadQuestionLit() async {
    print("Load calling");
    Response response = await QuestionRepo().getQuestionList();
    if (response.statusCode == 200) {
      questionList.value = [];
      print("got it");
      print(response.body.toString());
      questionList.value=QuestionModel.fromJson(response.body).questions!;

    } else {
      print(response.status);
    }
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
