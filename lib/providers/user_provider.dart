import 'package:flutter/material.dart';
import 'package:pos_app/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;
  UserModel? _userModel;
  String? _token;
  bool _isLoggedIn = false;

  UserModel? get userModel => _userModel;
  String? get token => _token;
  bool get isLoggedIn => _isLoggedIn;

  void setUserModel(Map<String, dynamic> userDetails) {
    isSuccess = false;
    notifyListeners();
    _userModel = UserModel.fromJson(userDetails);
    isSuccess = true;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
}
