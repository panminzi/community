import 'package:shared_preferences/shared_preferences.dart';

class BaseCache {
  late SharedPreferences prefs;
  static BaseCache? _instance;

  BaseCache._() {
    init();
  }

  BaseCache._pre(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  static Future<BaseCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = BaseCache._pre(prefs);
    }
    return _instance!;
  }

  static BaseCache getInstance() {
    if (_instance == null) {
      _instance = BaseCache._();
    }
    return _instance!;
  }

  Future<void> init() async {
    if (_instance == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  BaseCache setString(String key, String value) {
    prefs.setString(key, value);
    return this;
  }

  BaseCache setStringList(String key, List<String> value) {
    prefs.setStringList(key, value);
    return this;
  }

  BaseCache setInt(String key, int value) {
    prefs.setInt(key, value);
    return this;
  }

  BaseCache setDouble(String key, double value) {
    prefs.setDouble(key, value);
    return this;
  }

  BaseCache setBool(String key, bool value) {
    prefs.setBool(key, value);
    return this;
  }

  T? get<T>(String key) {
    return prefs.get(key) as T?;
  }

  List<String> getStringList(String key) {
    return prefs.getStringList(key) ?? [];
  }

  void clear() {
    prefs.clear();
  }
}
