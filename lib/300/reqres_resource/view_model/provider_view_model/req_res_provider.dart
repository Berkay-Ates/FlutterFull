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
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveresource(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resource));
  }
}
