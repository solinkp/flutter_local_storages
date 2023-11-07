import 'package:flutter/material.dart';

import 'package:flutter_local_storages/domain/storage_item/storage_item.dart';

class StorageItemCard extends StatelessWidget {
  final StorageItem item;

  const StorageItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goTo(context),
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.tealAccent.shade100,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.teal.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 10),
            const Icon(Icons.storage, color: Colors.white, size: 30),
          ],
        ),
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
      case 'Objectbox':
        Navigator.of(context).pushNamed('/objectbox');
        break;
      case 'Sembast':
        Navigator.of(context).pushNamed('/sembast');
        break;
      case 'CBL':
        Navigator.of(context).pushNamed('/cbl');
        break;
      default:
        break;
    }
  }
}
