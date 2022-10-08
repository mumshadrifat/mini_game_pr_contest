import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
   var prefs;
  @override
  Future<void> onInit() async {
    super.onInit();
     prefs = await SharedPreferences.getInstance();
     writeData();
  }
  writeData(){
    if(prefs.getInt('bestScore')==null){
      prefs.setInt('bestScore',202);
    }
    // if(box.read("bestScore")==null){
    // box.write("bestScore", bestScore);
    // }
    // else{
    //   print("----return from storage${box.read("bestScore")}");
    // }
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
