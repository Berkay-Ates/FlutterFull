import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('form field learn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          child: Column(children: [
            TextFormField(
              validator: FormValidator().isNotEmpty,
            ),
            TextFormField(
              validator: FormValidator().isNotEmpty,
            ),
            TextFormField(
              validator: FormValidator().isNotEmpty,
            ),
            TextFormField(
              validator: FormValidator().isNotEmpty,
            ),
            DropdownButtonFormField<String>(
                validator: FormValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(child: Text('B'), value: 'b'),
                  DropdownMenuItem(child: Text('E'), value: 'e'),
                  DropdownMenuItem(child: Text('R'), value: 'r'),
                  DropdownMenuItem(child: Text('K'), value: 'k'),
                  DropdownMenuItem(child: Text('A'), value: 'a'),
                  DropdownMenuItem(child: Text('Y'), value: 'y'),
                ],
                onChanged: (value) => null),
            ElevatedButton(onPressed: () => _key.currentState?.validate(), child: const Text('save')),
          ]),
        ),
      ),
    );
  }
}

class FormValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessages._cantBeNull;
  }
}

class ValidatorMessages {
  static const _cantBeNull = 'Bu alan boş geçilemez';
}

//? belirli bir key ile form'u bagladık.
//? dışarıdan bir aksiyon ile de _key üzerinden Form componentlerine erişerek bu formun Form fieldlarının
//? validatenfonksiyonunu çağırdık. Dışarıdaki bu aksiyon gerek post istegi veya herhengi bir button
//? tıklama olayı olabilir.

//? eğer otomatik olarak vu vaildate işlemi yapılsın istersek Form'un default olarak userInteraction gelen
//? autoValidateMode özelliğini AutomodeVAlidation.always gibi değiştirebiliriz.
