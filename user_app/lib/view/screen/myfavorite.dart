import 'package:user_app/controller/myfavoritecontroller.dart';
import 'package:user_app/core/class/handlingdataview.dart';
import 'package:user_app/core/constant/routes.dart';
import 'package:user_app/view/screen/home.dart';
import 'package:user_app/view/widget/customappbar.dart';
import 'package:user_app/view/widget/myfavorite/customlistfavoriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
            builder: ((controller) => ListView(children: [
              CustomAppBar(
                titleappbar: "Find Product",
                onPressedSearch: (){
                  controller.onSearchItems();
                },
                onPressedIconFavorite: (){
                  Get.toNamed(AppRoute.myfavroite);
                },
                mycontroller: controller.search!,
                onChanged: (val){
                  controller.checkSearch(val);
                },
              ),
              const SizedBox(height: 20,),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return  CustomListFavoriteItems(itemsModel: controller.data[index]) ;
                    },
                  ):
                  ListItemsSearch(listdatamodel: controller.listdata,)),
            ]))),
      ),
    );
  }
}