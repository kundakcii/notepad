import 'package:deneme_1/models/user_model.dart';
import 'package:deneme_1/services/auth_service.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthService _authService = AuthService();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authService.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
