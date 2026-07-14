import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:store/core/helpers/api_constants.dart';

class CacheHelper
{
  static final storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true
    ));

    // ================= get token ===================
    static Future <String> getToken()  async 
    {
     return await storage.read(key: "token")??"";
    }

    // ================= save token ===================
    static Future<void> saveToken(String token) async 
    {
      await storage.write(key: ApiConstants.token, value: token);
    }

    // ================= delete token ===================
    static Future<void> deleteToken() async 
    {
      await storage.delete(key: ApiConstants.token);
    }
}