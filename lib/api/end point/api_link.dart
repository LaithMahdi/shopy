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
  static const String logout = "$api/users/logout";
  // HomePAGE API
  static const String getHomePage = "$api/shoes/homepage";
  //localhost:8000/api/shoes/shoeslist/2
  static const String getAllShoes = "$api/shoes/shoeslist";

  static String getDetailShoes(int id) {
    return "$getAllShoes/$id";
  }

  static String category = "$api/shoes/category";
  static String getShoesByCategory(int id) {
    return "$category/$id";
  }

  static String postFavorite = "$api/shoes/favorites/";
  static String deleteFavorite(int id) {
    return "$api/shoes/favorites/$id";
  }

  static String getUserFavorites(int userId) {
    return "$api/shoes/favorites/?user_id=$userId";
  }

  static String search(String textSearch) {
    return "$api/shoes/search?search=$textSearch";
  }
}
