
import 'package:get/get.dart';
class Dimension{
  static final double screenHeight=Get.context!.height;
  
  static final double screenWidth=Get.context!.width;
//========>Food page container
  static final double searchContainerHeight=screenHeight/(screenHeight/45);
  static final double searchContainerWidth=screenHeight/(screenHeight/45);

  static final double pageMainContainerHeight=screenHeight/2.64;
  static final double  pageViewContainerHeight=screenHeight/3.84;
  static final double textViewContainerHeight=screenHeight/7.03;

//============>Icon sizes
  static final double  iconSize16=screenHeight/42.71;
  static final double  iconSize20=screenHeight/34.15;
  static final double  iconSize24 =screenHeight/28.47;
  static final double IconSizeLarge=28;


//=====================>Spacing height
  static final double height5=screenHeight/136.68;
  static final double height10=screenHeight/68.34;
  static final double height15=screenHeight/45.56;
  static final double height20=screenHeight/34.17;
  static final double height30=screenHeight/22.78;
  static final double height45=screenHeight/15.18;
  static final double height100=screenHeight/6.834;


  // ==============>spacing width
  static final double width5=screenWidth/82.28;
  static final double width10=screenWidth/41.142;
  static final double width15=screenWidth/27.42;
  static final double width20=screenWidth/20.57;
  static final double width30=screenWidth/4.114;



//================>font size

  static final double smallFont=screenHeight/68.34;
  static final double mediumFont=screenHeight/42.71;
  static final double largeFont=screenHeight/34.15;
  static final double extraLargeFont=screenHeight/26.28;

//Radius
  static final double radius15=screenHeight/45.56;
  static final double radius20=screenHeight/34.17;
  static final double radius30=screenHeight/22.78;






//Listview size
  static final double listViewImageHeight=screenHeight/(screenHeight/110);
  static final double listViewImageWidth=screenWidth/(screenWidth/110);
  static final double listViewTextContainerHeight=screenHeight/(screenHeight/90);


//Popular details  page
  static final double popularPageImageHeight=screenHeight/(screenHeight/340);
  static final double popularTextContainerHeight=screenHeight-popularPageImageHeight;
  static final double bottomBarHeight=screenHeight/(screenHeight/120);

}