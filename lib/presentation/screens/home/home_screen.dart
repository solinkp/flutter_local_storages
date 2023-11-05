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
      body: CustomGridview(
        itemCount: storageItems.length,
        axisCount: 2,
        builder: (index) => StorageItemCard(item: storageItems[index]),
      ),
    );
  }
}
