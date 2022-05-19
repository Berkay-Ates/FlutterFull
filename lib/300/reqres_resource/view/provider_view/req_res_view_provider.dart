import 'package:flutter/material.dart';
import 'package:master/200/image_learn_200.dart';
import 'package:master/product/extension/string_exstension.dart';
import 'package:master/product/global/resource_context.dart';
import 'package:master/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';
import '../../../../product/service/project_dio.dart';
import '../../model/resource_model.dart';
import '../../service/reqres_servce.dart';
import '../../view_model/provider_view_model/req_res_provider.dart';

class ReqresViewWithProvider extends StatefulWidget {
  const ReqresViewWithProvider({Key? key}) : super(key: key);

  @override
  State<ReqresViewWithProvider> createState() => _ReqresViewWithProviderState();
}

class _ReqresViewWithProviderState extends State<ReqresViewWithProvider> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(reqresService: ReqresService(dioService)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<ReqResProvider>().isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Mission completed'),
            actions: [
              IconButton(
                  onPressed: () {
                    //? Provider içindeki düdük save edici şeyi kullanalım
                    context.read<ReqResProvider>().saveresource(context.read<ResourceContext>());
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const ImageLearn200())));
                  },
                  icon: const Icon(Icons.save))
            ],
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: (() {
                context.read<ThemeNotifier>().changeTheme();
              })),
          body: Column(
            children: [
              Selector<ReqResProvider, bool>(builder: ((context, value, child) {
                return value ? const Placeholder() : const Text('Selector Worked');
              }), selector: (context, provider) {
                return provider.isLoading;
              }),
              Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resource)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: ((context, index) {
        return Card(
          color: Color(items[index].color?.getColorCode ?? 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((items[index].name ?? 'there is no name from data')),
          ),
        );
      }),
    );
  }
}
