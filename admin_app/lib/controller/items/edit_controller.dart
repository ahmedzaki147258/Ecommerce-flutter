import 'dart:io';
import 'package:admin_app/controller/items/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/core/functions/uploadfile.dart';
import 'package:admin_app/data/datasource/categories_data.dart';
import 'package:admin_app/data/datasource/items_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:admin_app/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formState =  GlobalKey<FormState>();
  List<SelectedListItem> dropdownlist = [];

  late TextEditingController name, namear, desc, descar, count, price, discount, dropdownname, dropdownid;
  late TextEditingController catid, catname;
  ItemsModel? itemsModel;
  StatusRequest? statusRequest = StatusRequest.none;
  File? file; int? active;

  changeStatusActive(int val){
    active = val;
    update();
  }

  chooseImage() async{
    file = await fileUploadGallery(false);
    update();
  }
  editData() async {
    if(formState.currentState!.validate()){
      // if(file == null) return Get.snackbar("Warning", "please choose image svg");
      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "id": itemsModel!.itemsId.toString(),
        "imageold": itemsModel!.itemsImage,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "active": active.toString(),
        "catid": catid.text,
        "datenow": DateTime.now().toString()
      };

      var response = await itemsData.edit(data, file);
      print(response['newimage']);
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
    itemsModel = Get.arguments['itemsModel'];
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

    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    count.text = itemsModel!.itemsCount.toString();
    price.text = itemsModel!.itemsPrice.toString();
    discount.text = itemsModel!.itemsDiscount.toString();

    catid.text = itemsModel!.categoriesId.toString();
    catname.text = itemsModel!.categoriesName!;

    active = itemsModel!.itemsActive;
    super.onInit();
  }
}
