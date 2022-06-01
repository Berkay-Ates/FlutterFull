import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master/300/reqres_resource/model/resource_model.dart';
import 'package:master/300/reqres_resource/service/reqres_servce.dart';
import 'package:master/300/reqres_resource/view_model/provider_view_model/req_res_provider.dart';
import 'package:master/product/global/resource_context.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_save_model.dart';

@GenerateMocks([ReqResProvider])
void main() {
  setUp(() {
    Map<String, Object> values = <String, Object>{'vb': "Veli"};
    SharedPreferences.setMockInitialValues(values);
  });
  test('Reqres Test', () {
    final mocResProvider = ReqResProvider(reqresService: ReqresService(Dio()));
    final resouceContext = ResourceContext();
    bool? result = mocResProvider.saveresource(resouceContext, null);
    expect(result, null);
  });

  test('Prefs Test', () async {
    final preferences = await SharedPreferences.getInstance();
    final userSaveModal = UserSaveViewModel().getReadData(SharedPrefStore(preferences), 'key');
    expect(userSaveModal, false);
  });

  test('Internetsiz ReqRes Test', () async {
    final mocResProvider = ReqResProvider(reqresService: MockReqResService());
    final result = await mocResProvider.fetchItems();
    expect(result, isNotEmpty);
  });
}

//? mobilde testlerin en iyi yazılacagı yer hic kuskusuz ki cache kısmıdır.

class MockReqResService extends IReqresService {
  MockReqResService() : super(Dio());

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    return await ResourceModel(data: const [Data(color: 'a', id: 1)]);
  }
}
