import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/middleware/mymiddleware.dart';
import 'package:delivery_app/view/screen/auth/forgetpassword.dart';
import 'package:delivery_app/view/screen/auth/resetpassword.dart';
import 'package:delivery_app/view/screen/auth/success_resetpassword.dart';
import 'package:delivery_app/view/screen/auth/verifycode.dart';
import 'package:delivery_app/view/screen/auth/verifycodesignup.dart';
import 'package:delivery_app/view/screen/language.dart';
import 'package:delivery_app/view/screen/auth/login.dart';
import 'package:delivery_app/view/screen/homescreen.dart';
import 'package:delivery_app/view/screen/orders/details.dart';
import 'package:delivery_app/view/screen/orders/tracking.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),

  // Orders
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.tracking, page: () => const OrdersTracking()),
];
