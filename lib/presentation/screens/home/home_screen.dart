import 'package:flutter/material.dart';

import 'package:flutter_local_storages/core/constants/storage_items.dart';
import 'package:flutter_local_storages/presentation/layouts/base_layout.dart';
import 'package:flutter_local_storages/presentation/widgets/custom_gridview.dart';
import 'package:flutter_local_storages/presentation/widgets/storage_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Storages',
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              'NoSQL',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.teal,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.teal,
                  ),
            ),
            CustomGridview(
              itemCount: noSqlStorageItems.length,
              axisCount: 2,
              builder: (index) => StorageItemCard(item: noSqlStorageItems[index]),
            ),
            const Divider(indent: 15, endIndent: 15),
            const SizedBox(height: 10),
            Text(
              'SQL',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.teal,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.teal,
                  ),
            ),
            CustomGridview(
              itemCount: sqlStorageItems.length,
              axisCount: 2,
              builder: (index) => StorageItemCard(item: sqlStorageItems[index]),
            ),
          ],
        ),
      ),
    );
  }
}
