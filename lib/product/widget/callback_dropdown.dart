import 'package:flutter/material.dart';
import '../../300/callback_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({
    Key? key,
    required this.onUserSelected,
  }) : super(key: key);

  final void Function(CallbackUser user) onUserSelected;

  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallbackUser? _callbackUser;

  void _setUser(CallbackUser? user) {
    setState(() {
      _callbackUser = user;
    });
    if (_callbackUser != null) {
      widget.onUserSelected.call(_callbackUser!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallbackUser>(
        value: _callbackUser,
        items: CallbackUser.dummyUsers()
            .map((e) => DropdownMenuItem(
                  //* Dummy user'lar stataik olarak oto oluşturulacagı için gidip
                  //? Dropdown Button Çagrılır cagrolmaz direk gidip ordan dummy listeyi kendi okudu ve gerekli atamayı
                  //? olarak kendi halletti
                  child: Text(e.name),
                  value: e,
                ))
            .toList(),
        onChanged: _setUser);
  }
}
