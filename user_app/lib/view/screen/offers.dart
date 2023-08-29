import 'package:user_app/controller/favorite_controller.dart';
import 'package:user_app/controller/offers_controller.dart';
import 'package:user_app/core/class/handlingdataview.dart';
import 'package:user_app/core/constant/routes.dart';
import 'package:user_app/view/screen/home.dart';
import 'package:user_app/view/widget/customappbar.dart';
import 'package:user_app/view/widget/offers/customitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
    return GetBuilder<OffersController>(builder: (controller) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(children: [
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
        const SizedBox(height: 15,),
        !controller.isSearch ?
        HandlingDataView(statusRequest: controller.statusRequest, widget:
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.data.length,
            itemBuilder: (context, index){
              return CustomListItemsOffer(itemsModel: controller.data[index]);
            })
        ):
            ListItemsSearch(listdatamodel: controller.listdata)
      ],),
    ));
  }
}
