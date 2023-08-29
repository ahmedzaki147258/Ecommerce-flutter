import 'package:admin_app/controller/items/view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Products'),),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: (){Get.toNamed(AppRoute.itemsadd);}),
      body: GetBuilder<ItemsController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
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
                            child: Image.network("${AppLink.imagestItems}/${controller.data[index].itemsImage}", height: 80))),
                        Expanded(flex: 3, child: ListTile(
                          title: Text(controller.data[index].itemsName!),
                          subtitle: Text(controller.data[index].categoriesName!),
                          trailing: IconButton(icon: const Icon(Icons.delete_forever_outlined), onPressed: (){
                                Get.defaultDialog(title: "Wringing", middleText: "Do you sure to delete this category?", onCancel: (){},
                                    onConfirm: (){controller.deleteItems(controller.data[index].itemsId!, controller.data[index].itemsImage!); Get.back();});
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
