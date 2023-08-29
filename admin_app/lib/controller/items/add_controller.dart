import 'dart:io';
import 'package:admin_app/controller/items/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/core/functions/uploadfile.dart';
import 'package:admin_app/data/datasource/categories_data.dart';
import 'package:admin_app/data/datasource/items_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropdownlist = [];

  GlobalKey<FormState> formState =  GlobalKey<FormState>();
  late TextEditingController name, namear, desc, descar, count, price, discount, dropdownname, dropdownid;
  late TextEditingController catid, catname;
  StatusRequest? statusRequest = StatusRequest.none;
  File? file;


  chooseImageCamera() async{
    file = await inageUploadCamera();
    update();
  }

  chooseImageGallery() async{
    file = await fileUploadGallery(false);
    update();
  }
  showOptionImage() async{
    await showbottommenu(chooseImageCamera, chooseImageGallery);
  }

  addData() async {
    if(formState.currentState!.validate()){
      if(file == null) return Get.snackbar("Warning", "please choose image");
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid.text,
        "datenow": DateTime.now().toString()
      };
      var response = await itemsData.add(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsview);
          ItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure ;
        }
      }
      update();
    }
  }

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        for(int i=0; i<data.length;i++){
          dropdownlist.add(SelectedListItem(name: data[i].categoriesName!, value: data[i].categoriesId!.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    super.onInit();
  }

}
