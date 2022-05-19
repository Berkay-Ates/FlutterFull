part of './part_of_learn.dart';

class _PartOfWidget extends StatelessWidget with PreferredSizeWidget {
  const _PartOfWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('a'),
      actions: const [Icon(Icons.ac_unit_outlined)],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
