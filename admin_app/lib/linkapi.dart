class AppLink {
  static const String server = "http://192.168.1.3/ecommerce";
  static const String imageststatic = "http://192.168.1.3/ecommerce/upload";

  // ================================= Auth ========================== //
  static const String login = "$server/admin/auth/login.php";
  static const String verifycodessignup = "$server/admin/auth/verfiycode.php";
  static const String resend = "$server/admin/auth/resend.php";

  // ================================= ForgetPassword ========================== //
  static const String checkEmail = "$server/admin/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/admin/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/admin/forgetpassword/verifycode.php";

  // ================================= Categories ========================== //
  static const String categoriesview = "$server/admin/categories/view.php";
  static const String categoriesadd = "$server/admin/categories/add.php";
  static const String categoriesedit = "$server/admin/categories/edit.php";
  static const String categoriesdelete = "$server/admin/categories/delete.php";

  // ================================= Items ========================== //
  static const String itemsview = "$server/admin/items/view.php";
  static const String itemsadd = "$server/admin/items/add.php";
  static const String itemsedit = "$server/admin/items/edit.php";
  static const String itemsdelete = "$server/admin/items/delete.php";

  //========================== Image ============================ //
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";

  //========================== Orders ==========================//
  static const String approveOrders  = "$server/admin/orders/approve.php";
  static const String prepareOrders  = "$server/admin/orders/prepare.php";
  static const String viewarchiveOrders  = "$server/admin/orders/archive.php";
  static const String viewacceptedOrders  = "$server/admin/orders/viewaccepted.php";
  static const String viewpendingOrders  = "$server/admin/orders/viewpending.php";
  static const String detailsOrders  = "$server/admin/orders/details.php";
}
