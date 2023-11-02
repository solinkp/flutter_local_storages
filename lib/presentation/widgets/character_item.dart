import 'package:flutter/material.dart';

import 'package:flutter_local_storages/domain/character/base_domain.dart';

class CharacterItem extends StatelessWidget {
  final Character char;

  const CharacterItem({super.key, required this.char});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text(char.name)),
    );
  }
}
