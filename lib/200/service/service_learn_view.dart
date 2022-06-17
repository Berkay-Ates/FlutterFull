import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'comments_learn_view.dart';
import 'post_model.dart';
import 'post_service.dart';

class LearnService extends StatefulWidget {
  const LearnService({Key? key}) : super(key: key);

  @override
  State<LearnService> createState() => _LearnServiceState();
}

class _LearnServiceState extends State<LearnService> {
  final _title = 'Learn Service';
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  //? TEST EDILEBILIR KOD is STARTING
  late final IPostService _postService;

  void _cahangeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void fetchPostItems() async {
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      //? Mobil yazarken dart.html kütüphanesi sakın sakın importlanmasın
      final _datas = response.data;
      if (_datas is List) {
        //? gelen datayı al, maple sonra PostModel objelerine dönüştür ve bana bir liste olarak ver

        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
        _cahangeLoading();
      }
    }
  }

  void fetchPostItemsAdvance() async {
    final response = await _networkManager.get('posts');
    if (response.statusCode == HttpStatus.ok) {
      //? Mobil yazarken dart.html kütüphanesi sakın sakın importlanmasın
      final _datas = response.data;
      if (_datas is List) {
        //? gelen datayı al, maple sonra PostModel objelerine dönüştür ve bana bir liste olarak ver

        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
        _cahangeLoading();
      }
    }
  }

  void fetchPostItemsAdvance2() async {
    _cahangeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _cahangeLoading();
  }

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    //fetchPostItems();
    fetchPostItemsAdvance2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [_isLoading ? const Center(child: CircularProgressIndicator.adaptive()) : const SizedBox.shrink()],
      ),
      body: _items == null
          ? const Placeholder()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemCount: _items?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CommentLearnView(id: index)));
                      },
                      child: _PostCard(model: _items?[index]));
                },
              ),
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(_model?.title ?? 'no data'),
        subtitle: Text(_model?.body ?? ' no data'),
      ),
    );
  }
}
