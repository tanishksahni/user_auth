import 'package:flutter/material.dart';
import 'package:user_auth/Managers/user_auth.dart';

class AuthState extends ChangeNotifier {
  Map<String, dynamic>? _userData;

  AuthState() {
    _loadUserData();
  }

  Map<String, dynamic>? get userData => _userData;

  bool get isAuthenticated => _userData != null;

  Future<void> _loadUserData() async {
    final userData = await UserAuth().getStoredUserData();
    if (userData != null) {
      _userData = userData;
      notifyListeners();
    }
  }

  Future<void> loginUser(String email, String password) async {
    final userData = await UserAuth().loginUser(email, password);
    if (userData != null) {
      _userData = userData;
      notifyListeners();
    }
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    _userData = null;
    notifyListeners();
  }
}
