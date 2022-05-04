import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final String _title = 'Password text field learn';
  final TextEditingController _cont = TextEditingController();
  final _obscuringCharacter = '~';
  bool _isSecure = true;

  void changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _cont,
          autofillHints: const [AutofillHints.password],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
            hintText: 'Password',
            suffix: _iconVisibilityFadeAnimation(),
          ),
          obscureText: _isSecure ? true : false,
          obscuringCharacter: _obscuringCharacter,
        ),
      ),
    );
  }

  IconButton _iconVisibilityFadeAnimation() {
    return IconButton(
      icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_off_outlined),
          secondChild: const Icon(Icons.visibility_outlined),
          crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 450)),
      onPressed: () => changeSecure(),
      color: Colors.black,
    );
  }

  IconButton _iconVisibility() {
    return IconButton(
      icon: _isSecure ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined),
      onPressed: () => changeSecure(),
      color: Colors.black,
    );
  }
}

//? Password'un en sonuna visibility icon eklemek için Suffic-SufficIcon Parametrelerini kulllanırız 