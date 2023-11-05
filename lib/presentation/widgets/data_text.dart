import 'package:flutter/material.dart';

class DataText extends StatelessWidget {
  final String content;

  const DataText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(content));
  }
}
