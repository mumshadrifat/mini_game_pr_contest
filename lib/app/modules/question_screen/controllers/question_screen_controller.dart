import 'package:get/get.dart';
import 'package:mini_game_pr_contest/app/data/question_repo.dart';

import '../../../model/response_model/question_response.dart';

class QuestionScreenController extends GetxController {
  //TODO: Implement QuestionScreenController
  RxList<Questions> questionList=<Questions>[].obs;
  final count = 0.obs;
   RxInt counter=0.obs;
   var currentScore=0.obs;


  @override
  void onInit() {
    super.onInit();

    loadQuestionLit();
  }


  setBestScore(){

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
