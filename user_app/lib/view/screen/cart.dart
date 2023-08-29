import 'package:user_app/controller/cart_controller.dart';
import 'package:user_app/core/class/handlingdataview.dart';
import 'package:user_app/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:user_app/view/widget/cart/customitemscartlist.dart';
import 'package:user_app/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) => BottomNavgationBarCart(
          price: "${cartController.priceorders}",
          discount: "${controller.discountcoupon}",
          shipping: "100",
          totalprice: "${controller.getTotalPrice()}",
      controllercoupon: controller.controllercoupon!,
      onApplyCoupon: (){controller.checkcoupon();},
      ),),
   body: GetBuilder<CartController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(
     children: [
       const SizedBox(height: 10),
       TopCardCart(message: "You Have ${cartController.totalcountitems} Items in Your List"),
       Container(
         padding: EdgeInsets.all(10),
         child: Column(
           children: [
             ...List.generate(cartController.data.length, (index) => CustomItemsCartList(
                 name: "${cartController.data[index].itemsName}",
                 price: "${cartController.data[index].itemsPrice!-(cartController.data[index].itemsPrice! * cartController.data[index].itemsDiscount!)/100} \$",
                 count: "${cartController.data[index].countitems}",
                  imagename: "${controller.data[index].itemsImage}",
               onAdd: () async{
                  await cartController.add(cartController.data[index].itemsId!.toString());
                  cartController.refreshPage();
               },
               onRemove: () async{
                   await cartController.delete(cartController.data[index].itemsId!.toString());
                   cartController.refreshPage();
               },
             )),
           ],
         ),
       )
     ],
   )),),
    );
  }
}
