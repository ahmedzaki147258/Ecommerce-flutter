import 'package:user_app/core/class/crud.dart';
import 'package:user_app/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String usersid) async {
    var response = await crud.postData(AppLink.items, {"id": id, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
