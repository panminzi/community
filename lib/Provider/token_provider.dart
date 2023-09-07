import 'package:flutter/material.dart';

import '../Database/sp_base.dart';

class TokenProvider extends ChangeNotifier {
  String get token => BaseCache.getInstance().get("");
  setToken(String token) {
    BaseCache.getInstance().setString("", token);
  }
}