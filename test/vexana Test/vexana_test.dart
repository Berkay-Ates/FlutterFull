import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'vexana Model/unknownModel.dart';

void main() {
  late final INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: ' '));
  });
  test('Vexana Test', () async {
    await networkManager.send<UnknownModel, UnknownModel>('/unknown',
        parseModel: UnknownModel(), method: RequestType.GET);
  });
}
