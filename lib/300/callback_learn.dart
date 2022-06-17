import 'dart:developer';

import 'package:flutter/material.dart';

import '../product/widget/button/answer_button.dart';
import '../product/widget/button/loading_button.dart';
import '../product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CallBackLearn'),
      ),
      body: Column(
        children: [
          //! Dropdown Menu itemda da callbackların kullanımını goruyoruz
          CallBackDropDown(onUserSelected: (CallbackUser _user) => inspect(_user)),
          AnswerButton(onNumber: (randomNumber) {
            if (randomNumber % 3 == 1) {
              return true;
            }
            return false;
          }),
          LoadingButton(fetchData: (() async {
            await Future.delayed(const Duration(seconds: 2));
          }))
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  //TODO Remove dummy code
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('veli', 10),
      CallbackUser('veli2', 10),
      CallbackUser('veli21', 10),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
