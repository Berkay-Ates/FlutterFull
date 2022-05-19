import 'package:master/200/cache/shared_learn_cache.dart';
import 'package:master/300/reqres_resource/model/resource_model.dart';
import 'package:master/300/reqres_resource/service/reqres_servce.dart';
import 'package:master/product/service/project_dio.dart';
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
    reqresService = ReqresService(dioService);
    _fetchItems();
    super.initState();
  }

  void _fetchItems() async {
    changeLoading();
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
