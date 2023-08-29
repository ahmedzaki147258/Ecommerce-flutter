import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String deliveryid, int userid, int ordersid) async {
    var response = await crud.postData(AppLink.approveOrders, {"deliveryid": deliveryid, "usersid": userid.toString(), "ordersid": ordersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}