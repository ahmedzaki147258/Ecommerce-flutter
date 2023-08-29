import 'dart:io';
import 'package:admin_app/controller/caregories/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/core/functions/uploadfile.dart';
import 'package:admin_app/data/datasource/categories_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState =  GlobalKey<FormState>();
  late TextEditingController name, namear;
  CategoriesModel? categoriesModel;
  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  chooseImage() async{
    file = await fileUploadGallery(true);
    update();
  }
  editData() async {
    if(formState.currentState!.validate()){
      // if(file == null) return Get.snackbar("Warning", "please choose image svg");
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "id": categoriesModel!.categoriesId!.toString(),
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel!.categoriesImage!
      };
      var response = await categoriesData.edit(data, file);
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    namear.text = categoriesModel!.categoriesNameAr!;
    super.onInit();
  }
}
