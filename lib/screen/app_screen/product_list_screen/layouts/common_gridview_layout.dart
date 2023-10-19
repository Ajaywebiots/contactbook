import 'package:flutter/material.dart';

class CommonGridView extends StatelessWidget {
  final int? itemCount;

  final NullableIndexedWidgetBuilder? itemBuilder;

  const CommonGridView(
      {super.key, this.itemCount, this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15, mainAxisSpacing: 15, crossAxisCount: 2),
        itemBuilder: itemBuilder!);
  }
}
