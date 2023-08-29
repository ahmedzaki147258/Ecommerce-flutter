import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/functions/handingdatacontroller.dart';
import 'package:delivery_app/data/datasource/auth/verifycode.dart';

import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;


  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postdata(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
          Get.offNamed(AppRoute.resetPassword , arguments: {
            "email" : email
          });
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resendVerfiyCode(){
    verifyCodeForgetPasswordData.resendCode(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
