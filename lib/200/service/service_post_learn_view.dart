import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String _title = 'Service Post Learn';
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _dio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIDController = TextEditingController();

  void _cahangeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel model) async {
    _cahangeLoading();
    final response = await _dio.post('/posts', data: model);
    if (response.statusCode == HttpStatus.created) {
      setState(() {
        _title = 'Basarili';
      });
      _cahangeLoading();
      _titleController.clear();
      _bodyController.clear();
      _userIDController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          _isLoading ? const Center(child: CircularProgressIndicator.adaptive()) : const SizedBox.shrink(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              decoration: _textfieldDecoration('title'),
              controller: _titleController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: _textfieldDecoration('body'),
              controller: _bodyController,
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.name,
              decoration: _textfieldDecoration('user Id'),
              controller: _userIDController,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIDController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIDController.text));
                        _addItemToService(model);
                      }
                    },
              child: Text(
                'send',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _textfieldDecoration(String label) {
    return InputDecoration(
      label: Text(label),
      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
