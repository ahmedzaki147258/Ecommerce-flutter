import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/functions/handingdatacontroller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/orders/accepted_data.dart';
import 'package:admin_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersAcceptedController extends GetxController {

  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(int val) {
    if (val == 0) {
      return "delivery";
    } else {
      return "Receive";
    }
  }

  String printPaymentMethod(int val) {
    if (val == 0) {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(int val) {
    if (val == 0) {
      return "Pending Approval";
    } else if (val == 1) {
      return "The Order is being Prepared ";
    } else if (val == 2) {
      return "Ready To Picked up by Delivery man";
    }  else if (val == 3) {
      return "On The Way";
    } else {
      return "Archive";
    }
  }
  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  donePrepare(int ordersid, int usersid, int ordertype) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersAcceptedData.donePrepare(ordersid, usersid, ordertype);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
