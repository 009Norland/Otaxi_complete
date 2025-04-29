import 'package:get/get.dart';

class LoginController extends GetxController {
  var errorMessage = "".obs;
  StateErrorMessage(newErrorMessage) {
    errorMessage.value = newErrorMessage;
  }
}
