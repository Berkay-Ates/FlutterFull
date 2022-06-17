import 'dart:developer';

import '../../../200/cache/shared_learn_cache.dart';
import '../model/resource_model.dart';
import '../service/reqres_servce.dart';
import '../../../product/service/project_dio.dart';
import '../../../product/service/my_project_network_manager.dart';
import '../view/req_res_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDioMixin {
  //* LoadingStatefull icine aldıgı Generic class ile bir state'den türüyor
  //* State'den türeme özelligini ve de ReqresView'a verip gneric olarak da ReqresView'u verince
  //* ReqresViewModel abstrac classı hem loading staefull'un içindeki özelliklerialacak hem de
  //* ReqresView'un özelliklerini alacak sonra da _ReqresViewState'de ReqresVİewModel'dan türeyince
  //* herşey connected to eachother olmus oluyor

  late final IReqresService reqresService;
  List<Data> resource = [];
  @override
  void initState() {
    var duration = DurationManager.manager;
    inspect(duration);
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance
        .addBaseHeaderToToken('Tüm Project manager objelerine buradaki cumle token olarak atanmis oldu');
    _fetchItems();
    super.initState();
  }

  void _fetchItems() async {
    changeLoading();
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
