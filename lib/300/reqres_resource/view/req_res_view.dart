import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../product/extension/string_exstension.dart';
import '../view_model/req_res_view_modal.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

//* class _ReqresViewState extends ReqresViewModel {
class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Mission completed')),
      body: ListView.builder(
        itemCount: resource.length,
        itemBuilder: ((context, index) {
          inspect(resource[index]);
          //inspect(resource[index].colorValue);
          return Card(
            color: Color(resource[index].color?.getColorCode ?? 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text((resource[index].name ?? 'there is no name from data')),
            ),
          );
        }),
      ),
    );
  }
}
