import 'package:flutter/cupertino.dart';

import '../../../../product/global/resource_context.dart';
import '../../model/resource_model.dart';
import '../../service/reqres_servce.dart';

class ReqResProvider extends ChangeNotifier {
  List<Data> resource = [];
  bool isLoading = false;

  final IReqresService reqresService;
  ReqResProvider({required this.reqresService}) {
    _fetchItems();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetchItems() async {
    _changeLoading();
    resource = await fetchItems();
    _changeLoading();
  }

  Future<List<Data>> fetchItems() async {
    //* internetten veriyi cek ve eşle
    return (await reqresService.fetchResourceItem())?.data ?? [];
  }

  bool? saveresource(ResourceContext resourceContext, List<Data>? resources) {
    //? burada direk provider icindeki service den atanan resource'u saveToLocale Yapıyoruz.
    //? eger bunu da provider'dan okursak test edebilir hale gelebiliriz.
    resourceContext.saveModel(ResourceModel(data: resources));
    return resourceContext.model?.data?.isEmpty;
  }
}
