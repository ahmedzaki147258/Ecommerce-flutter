import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {"id": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  doneDelivery(int ordersid, int usersid) async {
    var response = await crud.postData(AppLink.doneOrders, {"ordersid": ordersid.toString(), "usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}