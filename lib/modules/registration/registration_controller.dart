import 'dart:io';

import 'package:get/get.dart';
import 'package:swapgo/data/repositories/registration_repository.dart';
import 'package:swapgo/services/connection_manager_controller.dart';
import 'package:swapgo/utils/app_constants.dart';



class RegistrationController extends GetxController {
  RxString statusCode = "".obs;
  RxString state = "".obs;
  RxString errorMessage = "".obs;
  RxString errorImg = "".obs;

  RxBool isFirstNameValid = true.obs;
  RxBool isLastNameValid = true.obs;
  RxBool isEmailValid = true.obs;
  RxBool isMobileNoValid = true.obs;
  RxBool isPasswordValid = true.obs;
  String panNumber = "";
  //final ConnectionManagerController connController = Get.find<ConnectionManagerController>();
  RegistrationRepository _repository = RegistrationRepository();

  @override
  void onInit() {

    /*if (Get.arguments != null) {
      panNumber = Get.arguments["String"] as String;
      print("Sent IPO_USER_PAN "+panNumber.toString());
    }*/

    super.onInit();
  }



  void isValidForm(String fname, String lname, String mobile, String email, String password){
    bool isValid = true;

    if(fname.length<=0){
      isFirstNameValid.value = false;
      isValid = false;
    }else if(lname.length<=0){
      isLastNameValid.value = false;
      isValid = false;
    }else if(mobile.length<=0){
    isMobileNoValid.value = false;
    isValid = false;
    }else if(email.length<=0){
    isEmailValid.value = false;
    isValid = false;
    }else if(password.length<=0){
    isPasswordValid.value = false;
    isValid = false;
    }

    if(isValid = true){
      Map<String, String> params = {
        "Fname": fname,
        "Lname": lname,
        "MobileNo": mobile,
        "Email": email,
        "Password": password,
      };
      callRegistrationAPI(params);
    }

  }

  void callRegistrationAPI(Map<String, String> params) async {
    try {
      print("callGetIPOList");
      state.value = AppConstants.LOADING;
      //if (connController.connectionType.value == 0) {
        print("TestController - No internet conn>>>");
     // } else {
        print("TestController - Active internet conn");
     // }
      var response = await _repository.callRegistrationAPI(params);

      String status = response.data['status'];
      print("RESPONSE DATA IPOStatusReport " + response.data.toString());
      if (status.toLowerCase() == AppConstants.SUCCESS.toLowerCase()) {
        state.value = AppConstants.SUCCESS;
        var extractedData = response.data['ipoReportData'] as List<dynamic>;

      } else {
        print("else Calling");
        state.value = AppConstants.FAILED;
        errorMessage.value = "Something went wrong";

      }
    } on SocketException catch (e) {
      print('SocketException');
      state.value = AppConstants.NO_INTERNET;
      errorMessage.value = "Please check Internet connection";
      print('Socket Error: No internet con: $e');
    } catch (e) {
      print('Catch e');
      state.value = AppConstants.FAILED;
      errorMessage.value = "Something went wrong";

      print(e);
    } finally {}
  }
}
