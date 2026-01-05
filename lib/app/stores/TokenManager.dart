import 'package:shared_preferences/shared_preferences.dart';

import '../constants/index.dart';

class TokenManager {
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = "";

  init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }

  Future<void> setToken(String val) async {
    final instance = await _getInstance();
    instance.setString(GlobalConstants.TOKEN_KEY, val);
    _token = val;
  }

  // 不建议使用异步获取tokne：
  // 在获取token时，如果token不存在，则返回空字符串，会导致后续的判断逻辑错误
  // 所以建议使用同步方法，把获得token的方法放到init中去，就不担心是否是异步了
  // getToken() async{
  //   final prefs = await _getInstance();
  //   return prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  // }
  String getToken() {
    return _token;
  }

  Future<void> removeToken() async{
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);// 磁盘
    _token = '';// 内存
  }
}

final tokenManager = TokenManager();
