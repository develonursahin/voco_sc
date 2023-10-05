import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSources {
  static UserLocalDataSources? _instance;
  late SharedPreferences _preferences;

  UserLocalDataSources._();

  static Future<UserLocalDataSources> getInstance() async {
    if (_instance == null) {
      _instance = UserLocalDataSources._();
      await _instance!._initSharedPreferences();
    }
    return _instance!;
  }

  Future<void> _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUserCredentials(String email, String password) async {
    await _preferences.setString('email', email);
    await _preferences.setString('password', password);
  }

  String? getEmail() {
    return _preferences.getString('email');
  }

  String? getPassword() {
    return _preferences.getString('password');
  }

  Future<void> saveUserToken(String userToken) async {
    await _preferences.setString('userToken', userToken);
  }

  String? getUserToken() {
    return _preferences.getString('userToken');
  }

  Future<void> clearUserCredentials() async {
    await _preferences.remove('email');
    await _preferences.remove('password');
  }

  Future<void> clearUserToken() async {
    await _preferences.remove('userToken');
  }
}
