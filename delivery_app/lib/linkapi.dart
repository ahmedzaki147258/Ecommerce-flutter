class AppLink {
  static const String server = "http://192.168.1.3/ecommerce";
  static const String imageststatic = "http://192.168.1.3/ecommerce/upload";

  // ================================= Auth ========================== //
  static const String login = "$server/delivery/auth/login.php";
  static const String verifycodessignup = "$server/delivery/auth/verfiycode.php";
  static const String resend = "$server/delivery/auth/resend.php";
  static const String checkEmail = "$server/delivery/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword = "$server/delivery/forgetpassword/verifycode.php";
  static const String resetPassword = "$server/delivery/forgetpassword/resetpassword.php";

  // ================================= Orders ========================== //
  static const String viewpendingOrders  = "$server/delivery/orders/pending.php";
  static const String viewacceptedOrders  = "$server/delivery/orders/accepted.php";
  static const String viewarchiveOrders  = "$server/delivery/orders/archive.php";
  static const String detailsOrders  = "$server/delivery/orders/details.php";
  static const String approveOrders  = "$server/delivery/orders/approve.php";
  static const String doneOrders  = "$server/delivery/orders/done.php";

}
