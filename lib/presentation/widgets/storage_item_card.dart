import 'package:flutter/material.dart';

import 'package:flutter_local_storages/domain/storage_item/storage_item.dart';

class StorageItemCard extends StatelessWidget {
  final StorageItem item;

  const StorageItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goTo(context),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(item.name)),
      ),
    );
  }

  _goTo(BuildContext context) {
    switch (item.name) {
      case 'Isar':
        Navigator.of(context).pushNamed('/isar');
        break;
      case 'Hive':
        Navigator.of(context).pushNamed('/hive');
        break;
      default:
        break;
    }
  }
}
