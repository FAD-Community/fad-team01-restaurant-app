import 'package:ka3da/core/api/end_points.dart';
import 'package:ka3da/core/cache/cache_helper.dart';

class LoginLocalDataSource {
  final CacheHelper cacheHelper;

  LoginLocalDataSource({required this.cacheHelper});

  Future<void> saveToken(String token) async {
    await CacheHelper.saveData(key: ApiKey.token, value: token);
  }

  String? getToken() {
    return CacheHelper.getString(key: ApiKey.token);
  }

  Future<void> removeToken() async {
    await CacheHelper.removeData(key: ApiKey.token);
  }
}
