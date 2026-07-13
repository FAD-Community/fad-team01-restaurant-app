class LoginEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String token;
  final String role;

  LoginEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.token,
    required this.role, required this.firstName, required this.lastName,
  });
}

