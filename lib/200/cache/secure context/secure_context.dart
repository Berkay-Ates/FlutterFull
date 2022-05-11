import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureKeys { token }

class SecureContextView extends StatefulWidget {
  const SecureContextView({Key? key}) : super(key: key);

  @override
  State<SecureContextView> createState() => _SecureContextViewState();
}

class _SecureContextViewState extends State<SecureContextView> {
  final TextEditingController _textEditingController = TextEditingController();
  final _secureContext = const FlutterSecureStorage();
  String _title = '';

  @override
  void initState() {
    super.initState();
    _getSecureItem(SecureKeys.token);
    //* bunun altında title'ı okumaya çalışırsam title arkada farlı bir thread de
    //* baslatılıp beklenilmedigi için title hala null olabilir
  }

  void _getSecureItem(SecureKeys key) async {
    _title = await _secureContext.read(key: key.name) ?? '';
    _title.isNotEmpty ? print(_title) : print('yeni kullanici');
    _textEditingController.text = _title;
    setState(() {});
  }

  void _saveString(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _secureContext.write(key: SecureKeys.token.name, value: _title);
          },
          label: Text('save')),
      body: TextField(
        controller: _textEditingController,
        onChanged: (value) => _saveString(value),
      ),
    );
  }
}
