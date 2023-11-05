import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/presentation/widgets/loader.dart';
import 'package:flutter_local_storages/presentation/widgets/data_text.dart';
import 'package:flutter_local_storages/application/hive/hive_provider.dart';
import 'package:flutter_local_storages/presentation/layouts/base_layout.dart';
import 'package:flutter_local_storages/presentation/widgets/character_item.dart';
import 'package:flutter_local_storages/presentation/widgets/custom_gridview.dart';

class HiveScreen extends ConsumerWidget {
  const HiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var hiveDataAsync = ref.watch(hiveCharsProvider);

    return BaseLayout(
      hasSyncAction: true,
      clearAction: () => ref.read(hiveCharsProvider.notifier).cleanData(),
      syncAction: () => ref.read(hiveCharsProvider.notifier).syncRemote(),
      title: 'Hive Data',
      body: hiveDataAsync.when(
        loading: () => const Loader(),
        error: (_, __) => const DataText(content: 'Error'),
        data: (data) => data.isEmpty
            ? const DataText(content: 'Empty Data')
            : CustomGridview(
                itemCount: data.length,
                axisCount: 2,
                builder: (index) => CharacterItem(char: data[index]),
              ),
      ),
    );
  }
}
