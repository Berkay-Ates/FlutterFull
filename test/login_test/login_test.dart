import 'package:flutter_test/flutter_test.dart';
import 'package:master/404/block/feature/login/model/login_model.dart';
import 'package:master/404/block/feature/login/service/login_service.dart';
import 'package:master/product/service/vexana_network_manager.dart';

void main() {
  late ILoginService loginService;
  setUp(() {
    loginService = LoginService(networkManager: VexanaNetworkManager());
  });

  test('eve.holt@reqres.in && cityslicka', () async {
    final response = await loginService.login(LoginModel('eve.holt@reqres.in', 'cityslicka'));
    expect(response?.data, isNotNull);
  });
}
