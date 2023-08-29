import 'package:admin_app/controller/caregories/edit_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/color.dart';
import 'package:admin_app/core/functions/validinput.dart';
import 'package:admin_app/core/shared/custombutton.dart';
import 'package:admin_app/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesEditController controller = Get.put(CategoriesEditController());
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Category'),),
        body: GetBuilder<CategoriesEditController>(builder: (controller)=> HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(children: [
                CustomTextFormGlobal(
                  hinttext: "category name",
                  labeltext: "category name",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 30, "type");
                  },
                  mycontroller: controller.name,
                  isNumber: false,
                ),
                CustomTextFormGlobal(
                  hinttext: "category name ( Arabic )",
                  labeltext: "category name ( Arabic )",
                  iconData: Icons.category,
                  valid: (val){
                    return validInput(val!, 1, 30, "type");
                  },
                  mycontroller: controller.namear,
                  isNumber: false,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(onPressed: (){
                      controller.chooseImage();
                    }, color: AppColor.thirdColor, textColor: AppColor.secondColor, child: Text("choose category image"),)),
                if(controller.file != null)
                  SvgPicture.file(controller.file!, height: 100),
                CustomButton(text: "Sive", onPressed: (){
                  controller.editData();
                },)
              ],),
            ),),
        ),)
    );
  }
}
