import 'package:admin_app/core/constant/routes.dart';
import 'package:admin_app/core/middleware/mymiddleware.dart';
import 'package:admin_app/view/screen/categories/add.dart';
import 'package:admin_app/view/screen/categories/edit.dart';
import 'package:admin_app/view/screen/categories/view.dart';
import 'package:admin_app/view/screen/home.dart';
import 'package:admin_app/view/screen/items/add.dart';
import 'package:admin_app/view/screen/items/edit.dart';
import 'package:admin_app/view/screen/items/view.dart';
import 'package:admin_app/view/screen/language.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:admin_app/view/screen/auth/login.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:admin_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin_app/view/screen/auth/verifycodesignup.dart';
import 'package:admin_app/view/screen/orders/details.dart';
import 'package:admin_app/view/screen/orders/screen.dart';
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

  // HomePage
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),

  // Categories
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),

  // Items
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),

  // Ordets
  GetPage(name: AppRoute.ordersscreen, page: () => const OrderScreen()),
];
