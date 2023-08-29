import 'package:user_app/controller/favorite_controller.dart';
import 'package:user_app/controller/items_controller.dart';
import 'package:user_app/core/class/handlingdataview.dart';
import 'package:user_app/core/constant/routes.dart';
import 'package:user_app/data/model/itemsmodel.dart';
import 'package:user_app/view/screen/home.dart';
import 'package:user_app/view/widget/customappbar.dart';
import 'package:user_app/view/widget/items/customlistitems.dart';
import 'package:user_app/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ItemControllerImp>(
            builder: (controller) => ListView(
                children: [
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
                  const SizedBox(height: 15),
                  const ListCategoriesItems(),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        controllerFav.isFavorite[controller.data[index]['items_id']] = controller.data[index]['favorite'].toString();
                        return CustomListItems(itemsModel: ItemsModel.fromJson(controller.data[index]));
                      }): ListItemsSearch(listdatamodel: controller.listdata,)),
                ],
              ),
            ),
          ),
    );
  }
}
