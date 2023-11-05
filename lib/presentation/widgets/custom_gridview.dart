import 'package:flutter/material.dart';

class CustomGridview extends StatelessWidget {
  final int itemCount;
  final Widget Function(int) builder;
  final int axisCount;

  const CustomGridview({
    super.key,
    required this.itemCount,
    required this.builder,
    this.axisCount = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisCount,
        childAspectRatio: axisCount > 1 ? 1 : 16 / 9,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (_, index) => builder(index),
    );
  }
}
