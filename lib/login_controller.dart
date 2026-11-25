import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'auth_service.dart';
import 'validators.dart';

class LoginController extends ChangeNotifier {
  LoginController(this._authService);

  final AuthService _authService;

  String _email = '';
  String _password = '';
  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _showErrors = false;
  String? _errorMessage;
  bool _isDisposed = false;

  bool get obscurePassword => _obscurePassword;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  String? get emailError => _showErrors ? validateEmail(_email) : null;
  String? get passwordError =>
      _showErrors ? validatePassword(_password) : null;

  bool get isFormValid =>
      validateEmail(_email) == null && validatePassword(_password) == null;

  void updateEmail(String value) {
    _email = value;
    _errorMessage = null;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    _errorMessage = null;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> signIn() async {
    _showErrors = true;
    if (!isFormValid) {
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.signIn(
        email: _email.trim(),
        password: _password,
      );

    } on FirebaseAuthException catch (e) {
      _errorMessage = authErrorMessage(e);
    } finally {
      _isLoading = false;
      if (!_isDisposed) {
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
