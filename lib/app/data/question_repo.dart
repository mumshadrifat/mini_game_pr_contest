
import 'package:get/get.dart';

import 'api_client.dart';

class QuestionRepo extends GetxService{
   ApiClient apiClient=ApiClient(appBaseUrl: "https://herosapp.nyc3.digitaloceanspaces.com");

 // QuestionRepo( { required this.apiClient});

   Future<Response> getQuestionList(){
    return  apiClient.getData("/quiz.json");
  }


}