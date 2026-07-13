class EndPoints {
  static const String baseUrl = "http://sonbolrestaurant.runasp.net/api/";

  // Authentication
  static const String login = "Authentication/Login";

  static const String register = "Authentication/Register";

  static const String logout = "Authentication/Logout";

  static const String forgetPassword = "Authentication/Forget-Password";

  static const String resetPassword = "Authentication/Reset-Password";

  static const String confirmEmail = "Authentication/Confirm-Email";
}

class ApiKey {
  static const String id = "id";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String userName = "userName";
  static const String email = "email";
  static const String token = "token";
  static const String role = "role";
}
