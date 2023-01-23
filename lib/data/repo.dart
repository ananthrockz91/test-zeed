import 'package:zeed/data/auth_service.dart';

class AppRepository {
  late final AuthService _authService;
  AuthService get authService => _authService;

  Future<void> setup() async {
    _authService = AuthService();
    await _authService.init();
  }
}
