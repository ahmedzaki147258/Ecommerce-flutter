import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/functions/handingdatacontroller.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/datasource/auth/login.dart';
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
          if(response['data']['delivery_approve'] == 1){
            myServices.sharedPreferences.setString("id", response['data']['delivery_id'].toString());
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString("username", response['data']['delivery_name']);
            myServices.sharedPreferences.setString("email", response['data']['delivery_email']);
            myServices.sharedPreferences.setString("phone", response['data']['delivery_phone']);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("delivery");
            Get.offNamed(AppRoute.homepage);
          }else {
            Get.toNamed(AppRoute.verfiyCodeSignUp, arguments: {
              "email": email.text,
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