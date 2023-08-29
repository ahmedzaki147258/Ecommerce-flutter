import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(int userid, int ordersid) async {
    var response = await crud.postData(AppLink.approveOrders,
        {"usersid": userid.toString(), "ordersid": ordersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}