import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(int ordersid, int usersid, int ordertype) async {
    var response = await crud.postData(AppLink.prepareOrders, {"ordersid": ordersid.toString(), "usersid": usersid.toString(), "ordertype": ordertype.toString()});
    return response.fold((l) => l, (r) => r);
  }
}