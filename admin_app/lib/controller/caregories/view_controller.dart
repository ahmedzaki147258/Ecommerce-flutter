import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/data/datasource/categories_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  deleteCategory(int id, String imagename){
    categoriesData.delete({"id": id.toString(), "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(AppRoute.categoriesedit, arguments: {
      'categoriesModel': categoriesModel
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
