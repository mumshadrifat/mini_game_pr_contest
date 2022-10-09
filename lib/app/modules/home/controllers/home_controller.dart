import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/local_db.dart';
import '../../../model/local_model/best_score.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
   var bestScore;
  List<Map>? bestScoreList;
  BestScore bestScoreModel=BestScore(bestScore: 230);
  int? tableChecker;
  RxInt maxScore=0.obs;



  @override
  Future<void> onInit() async {
    super.onInit();
  }
    dataInsert() async {
       print(DataBaseHelper.instance.tableIsEmpty());
    tableChecker=await DataBaseHelper.instance.tableIsEmpty();


      if((await DataBaseHelper.instance.tableIsEmpty()==0)){
        DataBaseHelper.instance.insertBestScoreTable(bestScoreModel);

        bestScoreList=await DataBaseHelper.instance.newQuery(1);
          maxScore.value=bestScoreList?[0]["bestScore"];
          print(maxScore.value);

      }
      else{
        bestScoreList=await DataBaseHelper.instance.newQuery(1);
        maxScore.value=bestScoreList?[0]["bestScore"];

      }
  update();



    }
    
   // prefs = await SharedPreferences.getInstance();
   // bestScore=box.read("bestScore")??200;
     //writeData();

  // writeData(){
  //   if(prefs.getInt('bestScore')==null){
  //     prefs.setInt('bestScore',202);
  //   }
  //   // if(box.read("bestScore")==null){
  //   // box.write("bestScore", bestScore);
  //   // }
  //   // else{
  //   //   print("----return from storage${box.read("bestScore")}");
  //   // }
  // }
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
