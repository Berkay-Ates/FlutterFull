import 'package:flutter/material.dart';
import 'package:master/200/service/post_service.dart';

import '../../200/service/post_model.dart';

class TabbarFeedView extends StatefulWidget {
  const TabbarFeedView({Key? key}) : super(key: key);
  @override
  State<TabbarFeedView> createState() => _TabbarFeedViewState();
}

class _TabbarFeedViewState extends State<TabbarFeedView> with AutomaticKeepAliveClientMixin {
  final IPostService _postService = PostService();
  late final Future<List<PostModel>?> _items;

  @override
  void initState() {
    super.initState();
    _items = _postService.fetchPostItemsAdvance();
  }

  //? calısır cunku postService de IPostService'den turedi ama obje nihayetinde PostService;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {});
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      appBar: AppBar(title: const Text('FutureBuilder Page')),
      body: _FutureBuilderWidget(items: _items),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _FutureBuilderWidget extends StatelessWidget {
  const _FutureBuilderWidget({
    Key? key,
    required Future<List<PostModel>?> items,
  })  : _items = items,
        super(key: key);

  final Future<List<PostModel>?> _items;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
      future: _items,
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('no data');
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(snapshot.data?[index].title ?? 'Check the connection'),
                    ),
                  );
                },
              );
            } else {
              return const Placeholder();
            }
        }
      },
    );
  }
}
