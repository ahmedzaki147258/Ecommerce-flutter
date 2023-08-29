import 'package:user_app/core/class/crud.dart';
import 'package:user_app/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  rating(String oredrsid, String rating, String comment) async {
    var response = await crud.postData(AppLink.rating, {"id": oredrsid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}