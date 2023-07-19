class ApiLink {
  // Root API
  static const String api = "http://10.0.2.2:8000/api";
  // Authentification API
  static const String postLogin = "$api/users/login";
  static const String getUser = "$api/users/user";
  static const String postRegisterUser = "$api/users/register";
  static const String postSendVerifyCode = "$api/users/sendverifycode";
  static const String postCheckVerifyCode = "$api/users/checkverifycode";
  static const String postRestPassword = "$api/users/restpassword";
  // HomePAGE API
  static const String getHomePage = "$api/shoes/homepage";
  //localhost:8000/api/shoes/shoeslist/2
  static const String getAllShoes = "$api/shoes/shoeslist";

  static String getDetailShoes(int id) {
    return "$getAllShoes/$id";
  }
}
