import 'dart:io';
import 'package:admin_app/controller/caregories/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/core/functions/uploadfile.dart';
import 'package:admin_app/data/datasource/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState =  GlobalKey<FormState>();
  late TextEditingController name, namear;
  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  chooseImage() async{
    file = await fileUploadGallery(true);
    update();
  }
  addData() async {
    if(formState.currentState!.validate()){
      if(file == null) return Get.snackbar("Warning", "please choose image svg");
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,

      };
      var response = await categoriesData.add(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.categoriesview);
          CategoriesController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure ;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
