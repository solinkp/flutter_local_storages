import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/presentation/widgets/loader.dart';
import 'package:flutter_local_storages/presentation/widgets/data_text.dart';
import 'package:flutter_local_storages/presentation/layouts/base_layout.dart';
import 'package:flutter_local_storages/presentation/widgets/character_item.dart';
import 'package:flutter_local_storages/presentation/widgets/custom_gridview.dart';
import 'package:flutter_local_storages/application/sqflite/sqflite_provider.dart';

class SqfLiteScreen extends ConsumerWidget {
  const SqfLiteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sqfliteDataAsync = ref.watch(sqfLiteCharsProvider);

    return BaseLayout(
      hasSyncAction: true,
      clearAction: () => ref.read(sqfLiteCharsProvider.notifier).cleanData(),
      syncAction: () => ref.read(sqfLiteCharsProvider.notifier).syncRemote(),
      title: 'SQFLite Data',
      body: sqfliteDataAsync.when(
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
