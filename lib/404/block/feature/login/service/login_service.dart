import 'package:vexana/vexana.dart';

import '../../../../../product/model/token_model.dart';
import '../model/login_model.dart';

abstract class ILoginService {
  INetworkManager networkManager;
  ILoginService({required this.networkManager});

  Future<IResponseModel<TokenModel?>?> login(LoginModel loginModel);
  final String _path = 'api/login';
}

class LoginService extends ILoginService {
  LoginService({required INetworkManager networkManager}) : super(networkManager: networkManager);

  @override
  Future<IResponseModel<TokenModel?>?> login(LoginModel loginModel) async {
    return await networkManager.send<TokenModel, TokenModel>('api/login',
        parseModel: TokenModel(), data: loginModel, method: RequestType.POST);
  }
}

//? abstract bir class icine birkac tane fonksiyon tanımlayıp istedigimiz yerlerde 
//? tanımlanmış olan abstract classı exstends ettirip icindeki fonksiyonları classın özelliklerine gore 
//? tanımlayabiliyoruz . 

//* bu durumda servise login olacak fonksiyonu tanımladık ve constructoru icerisinde de servis objesini 
//* istedik 
