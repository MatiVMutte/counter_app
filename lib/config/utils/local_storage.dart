import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  late SharedPreferences _prefs;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setValue(String key, String value) async {
    await _init();
    await _prefs.setString(key, value);
  }

  Future<String?> getValue(String key) async {
    await _init();
    return _prefs.getString(key);
  }
  
  Future<void> removeValue(String key) async {
    await _init();
    await _prefs.remove(key);
  }
  
}