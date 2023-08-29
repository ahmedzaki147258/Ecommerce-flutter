import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewarchiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }

}