import 'package:cached_network_image/cached_network_image.dart';
import 'package:user_app/controller/favorite_controller.dart';
import 'package:user_app/controller/items_controller.dart';
import 'package:user_app/core/constant/color.dart';
import 'package:user_app/core/constant/imgaeasset.dart';
import 'package:user_app/core/functions/translatefatabase.dart';
import 'package:user_app/data/model/itemsmodel.dart';
import 'package:user_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return InkWell(
            onTap: (){
              controller.goToPageProductDetails(itemsModel);
            },
            child: Card(
              child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: itemsModel.itemsId!,
                        child: CachedNetworkImage(
                          imageUrl: AppLink.imagestItems +"/"+ itemsModel.itemsImage!,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 15) ,
                      Text(translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName) , style: const TextStyle(color: AppColor.black, fontSize: 16, fontWeight: FontWeight.bold),),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: const Icon(Icons.timer_sharp, color: AppColor.grey,)
                          ),
                          const SizedBox(width: 5,),
                          Text("${controller.deliverytime} Minute", textAlign: TextAlign.center, style: TextStyle(fontFamily: "sans"),),
                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemsPriceDiscount} \$", style: const TextStyle(color: AppColor.primaryColor, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "sans")),
                          GetBuilder<FavoriteController>(builder: (controller) => IconButton(onPressed: (){
                            if(controller.isFavorite[itemsModel.itemsId] == "1"){
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.removeFavorite(itemsModel.itemsId!.toString());
                            }else{
                              controller.setFavorite(itemsModel.itemsId, "1");
                              controller.addFavorite(itemsModel.itemsId!.toString());
                            }
                          }, icon: Icon(controller.isFavorite[itemsModel.itemsId] == "1" ? Icons.favorite : Icons.favorite_border_outlined, color: AppColor.primaryColor,)))
                        ],)
                    ],
                  ),
                ),
              ),
              if(itemsModel.itemsDiscount != 0)
              Positioned(
                  top: 4,
                  left: 5,
                  child: Image.asset(AppImageAsset.saleOne, width: 40,))
            ],),
          ),);

  }
}
