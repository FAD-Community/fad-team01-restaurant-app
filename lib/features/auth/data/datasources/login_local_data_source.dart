import 'package:ka3da/core/databases/cache/cache_helper.dart';

class LoginLocalDataSource {
  final CacheHelper cache;

  LoginLocalDataSource({required this.cache});

  Future<void> saveUser({
    required String token,
    required String firstName,
  }) async {
    await cache.saveData(key: "token", value: token);

    await cache.saveData(key: "firstName", value: firstName);
  }

  String? getToken() {
    return cache.getDataString(key: "token");
  }

  String? getFirstName() {
    return cache.getDataString(key: "firstName");
  }

  Future<void> removeUser() async {
    await cache.removeData(key: "token");
    await cache.removeData(key: "firstName");
  }
}
