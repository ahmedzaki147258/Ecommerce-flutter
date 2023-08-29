import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/items_data.dart';
import 'package:admin_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  deleteItems(int id, String imagename){
    itemsData.delete({"id": id.toString(), "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsedit, arguments: {
      'itemsModel': itemsModel
    });
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  myback(){
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }
}
