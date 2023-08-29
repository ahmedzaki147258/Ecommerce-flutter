import 'package:admin_app/controller/caregories/view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(title: const Text('Categories'),),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: (){Get.toNamed(AppRoute.categoriesadd);}),
      body: GetBuilder<CategoriesController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: WillPopScope(
            onWillPop: () => controller.myback(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        controller.goToPageEdit(controller.data[index]);
                      },
                      child: Card(child: Row(children: [
                        Expanded(flex: 2, child: Container(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.network("${AppLink.imagestCategories}/${controller.data[index].categoriesImage}", height: 80))),
                        Expanded(flex: 3, child: ListTile(
                          title: Text(controller.data[index].categoriesName!),
                          subtitle: Text(controller.data[index].categoriesDatetime!),
                          trailing: IconButton(icon: const Icon(Icons.delete_forever_outlined), onPressed: (){
                                Get.defaultDialog(title: "Wringing", middleText: "Do you sure to delete this category?", onCancel: (){},
                                    onConfirm: (){controller.deleteCategory(controller.data[index].categoriesId!, controller.data[index].categoriesImage!); Get.back();});
                              }),
                        ))
                      ],)),
                    );
                  }),
            ),
          )),),)
    );
  }
}
