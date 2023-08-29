import 'package:user_app/controller/home_controller.dart';
import 'package:user_app/core/constant/color.dart';
import 'package:user_app/core/functions/translatefatabase.dart';
import 'package:user_app/data/model/categoriesmodel.dart';
import 'package:user_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 10,),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Categories(categoriesModel: CategoriesModel.fromJson(controller.categories[index]), i: index,);
          }),);
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({Key? key, required this.categoriesModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories, i, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 70,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.network("${AppLink.imagestCategories}/${categoriesModel.categoriesImage}", color: AppColor.secondColor,),),
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
