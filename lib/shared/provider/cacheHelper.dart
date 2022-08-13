import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper
{
  static late SharedPreferences sharedPreferences ;
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool>putbool({required String key,required bool isdark})async{
    return await sharedPreferences.setBool(key, isdark);
}
static getbool({required String key}){
    return sharedPreferences.getBool(key);
}
}