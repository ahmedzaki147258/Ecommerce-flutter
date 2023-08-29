import 'package:admin_app/controller/items/edit_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custombutton.dart';
import 'package:admin_app/core/shared/customdropdownsearch.dart';
import 'package:admin_app/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Product'),),
        body: GetBuilder<ItemsEditController>(builder: (controller)=> HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(children: [
                const SizedBox(height: 7,),
                CustomTextFormGlobal(
                  hinttext: "item name",
                  labeltext: "item name",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 50, "type");
                  },
                  mycontroller: controller.name,
                  isNumber: false,
                ),
                CustomTextFormGlobal(
                  hinttext: "item name ( Arabic )",
                  labeltext: "item name ( Arabic )",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 50, "type");
                  },
                  mycontroller: controller.namear,
                  isNumber: false,
                ),
                CustomTextFormGlobal(
                  hinttext: "description name",
                  labeltext: "description name",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 200, "type");
                  },
                  mycontroller: controller.desc,
                  isNumber: false,
                ),
                CustomTextFormGlobal(
                  hinttext: "description name ( Arabic )",
                  labeltext: "description name ( Arabic )",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 200, "type");
                  },
                  mycontroller: controller.descar,
                  isNumber: false,
                ),
                CustomTextFormGlobal(
                  hinttext: "count",
                  labeltext: "count",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 30, "type");
                  },
                  mycontroller: controller.count,
                  isNumber: true,
                ),
                CustomTextFormGlobal(
                  hinttext: "price",
                  labeltext: "price",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 30, "type");
                  },
                  mycontroller: controller.price,
                  isNumber: true,
                ),
                CustomTextFormGlobal(
                  hinttext: "discount",
                  labeltext: "discount",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 30, "type");
                  },
                  mycontroller: controller.discount,
                  isNumber: true,
                ),
                CustomDropDownSearch(
                  title: "Choose Category",
                  listdata: controller.dropdownlist,
                  dropdownSelectedID: controller.catid,
                  dropdownSelectedName: controller.catname,
                ),
                const SizedBox(height: 10,),
                RadioListTile(title: const Text("hidden"), value: 0, groupValue: controller.active, onChanged: (val){controller.changeStatusActive(int.parse(val.toString()));}),
                RadioListTile(title: const Text("active"), value: 1, groupValue: controller.active, onChanged: (val){controller.changeStatusActive(int.parse(val.toString()));}),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(onPressed: (){
                      controller.chooseImage();
                    }, color: AppColor.thirdColor, textColor: AppColor.secondColor, child: const Text("choose item image"),)),
                if(controller.file != null)
                  Image.file(controller.file!, height: 100),
                CustomButton(text: "Save", onPressed: (){
                  controller.editData();
                },)
              ],),
            ),),
        ),)
    );
  }
}
