import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
   
  LoginData loginData  = LoginData(Get.find()) ; 

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading; 
      update() ; 
      var response = await loginData.postdata(email.text , password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if(response['data']['admin_approve'] == 1){
            myServices.sharedPreferences.setString("id", response['data']['admin_id'].toString());
            myServices.sharedPreferences.setString("username", response['data']['admin_name']);
            myServices.sharedPreferences.setString("email", response['data']['admin_email']);
            myServices.sharedPreferences.setString("phone", response['data']['admin_phone'].toString());
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("services");
            Get.offNamed(AppRoute.homepage);
          }else {
            Get.toNamed(AppRoute.verfiyCodeSignUp, arguments: {
              "email": email.text
            });
          }
        } else {
          Get.defaultDialog(title: "Warning" , middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      
    }
  }

  @override
  void onInit() {
    myServices.sharedPreferences.setString("step", "1");
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
