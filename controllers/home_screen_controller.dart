import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  var selectedPageIndex=0.obs;

  UpdateSelection(pos)=> selectedPageIndex.value = pos;
}