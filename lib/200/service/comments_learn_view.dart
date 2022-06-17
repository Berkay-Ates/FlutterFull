import 'package:flutter/material.dart';

import 'comment_model.dart';
import 'post_service.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({
    Key? key,
    this.id,
  }) : super(key: key);
  final int? id;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  late final int? _id;
  bool _isLoading = true;
  final _title = 'Comment Learn View';
  late final IPostService _postService;
  List<CommentModel>? _commentItems;
  //* late final List<CommentModel>? _commentItems;
  //!? late init error

  void fetchCommentModels(int id) async {
    changeLoading();
    _commentItems = await _postService.fetchRelatedCommentsWithPostId(id);
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchCommentModels(widget.id ?? 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [!_isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink()],
      ),
      body: _commentItems == null
          ? const Placeholder()
          : ListView.builder(
              itemCount: _commentItems?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(_commentItems?[index].name ?? 'no data'),
                    subtitle: Text(_commentItems?[index].body ?? 'no data'),
                  ),
                );
              },
            ),
    );
  }
}
