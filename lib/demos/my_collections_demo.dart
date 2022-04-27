import 'package:flutter/material.dart';

class MyCollectionsDemo extends StatefulWidget {
  const MyCollectionsDemo({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemo> createState() => _MyCollectionsDemoState();
}

class _MyCollectionsDemoState extends State<MyCollectionsDemo> {
  late final List<_CollectionModels> _items;

  @override
  void initState() {
    super.initState();
    _items = _CollectionsItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Collections Demo'),
        ),
        body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: ((context, index) {
            return _CategoryCard(
              model: _items[index],
            );
          }),
        ));
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required _CollectionModels model,
  })  : _model = model,
        super(key: key);

  final _CollectionModels _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Card(
        shape: _BorderRadius().cardBorder,
        child: Column(
          children: [
            Image.asset(_model.imagePath),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_model.title),
                  Text(_model.price.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CollectionModels {
  String imagePath;
  String title;
  double price;

  _CollectionModels({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class _PaddingUtility {}

class _CollectionsItems {
  late final List<_CollectionModels> items;
  _CollectionsItems() {
    items = [
      _CollectionModels(imagePath: ProjectImages.imageCollections, title: 'Abstract Art 1', price: 3.4),
      _CollectionModels(imagePath: ProjectImages.imageCollections, title: 'Abstract Art 2', price: 2.4),
      _CollectionModels(imagePath: ProjectImages.imageCollections, title: 'Abstract Art 3', price: 5.6),
      _CollectionModels(imagePath: ProjectImages.imageCollections, title: 'Abstract Art 4', price: 1.7),
      _CollectionModels(imagePath: ProjectImages.imageCollections, title: 'Abstract Art 5', price: 5.0),
    ];
  }
}

class _BorderRadius {
  final ShapeBorder cardBorder = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));
}

class ProjectImages {
  static const imageCollections = 'assets/png/ic_roundedimage.png';
}
