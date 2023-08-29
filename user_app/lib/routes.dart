import 'package:user_app/core/constant/routes.dart';
import 'package:user_app/core/middleware/mymiddleware.dart';
import 'package:user_app/view/address/add.dart';
import 'package:user_app/view/address/adddetails.dart';
import 'package:user_app/view/address/view.dart';
import 'package:user_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:user_app/view/screen/auth/login.dart';
import 'package:user_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:user_app/view/screen/auth/signup.dart';
import 'package:user_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:user_app/view/screen/auth/success_signup.dart';
import 'package:user_app/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:user_app/view/screen/auth/verifycodesignup.dart';
import 'package:user_app/view/screen/cart.dart';
import 'package:user_app/view/screen/checkout.dart';
import 'package:user_app/view/screen/homescreen.dart';
import 'package:user_app/view/screen/items.dart';
import 'package:user_app/view/screen/language.dart';
import 'package:user_app/view/screen/myfavorite.dart';
import 'package:user_app/view/screen/onboarding.dart';
import 'package:user_app/view/screen/orders/archive.dart';
import 'package:user_app/view/screen/orders/details.dart';
import 'package:user_app/view/screen/orders/pending.dart';
import 'package:user_app/view/screen/productdetails.dart';
import 'package:get/get.dart';
import 'package:user_app/view/widget/orders/ordertracking.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),

  // HomePage
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  // Address
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),

  // Checkout
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.orderstracking, page: () => const OrdersTracking()),

];
