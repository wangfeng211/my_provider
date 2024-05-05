import 'package:flutter/material.dart';

class UserInfoModel extends ChangeNotifier {
  //姓名
  String _name = "Tom";
  String get name => _name;
  set name(String val){
    _name = val;
    notifyListeners();
  }

  //手机号
  String _phone = "18911112222";
  String get phone => _phone;
  set phone(String val){
    _phone = val;
    notifyListeners();
  }

  //是否显示手机号 默认显示
  bool _showPhone = true;
  bool get showPhone => _showPhone;
  set showPhone(bool val) {
    _showPhone = val;
    notifyListeners();
  }
}