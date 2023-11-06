import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/presentation/widgets/loader.dart';
import 'package:flutter_local_storages/presentation/widgets/data_text.dart';
import 'package:flutter_local_storages/presentation/layouts/base_layout.dart';
import 'package:flutter_local_storages/presentation/widgets/character_item.dart';
import 'package:flutter_local_storages/presentation/widgets/custom_gridview.dart';
import 'package:flutter_local_storages/application/objectbox/objectbox_provider.dart';

class ObjectboxScreen extends ConsumerWidget {
  const ObjectboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var objboxDataAsync = ref.watch(objboxCharsProvider);

    return BaseLayout(
      hasSyncAction: true,
      clearAction: () => ref.read(objboxCharsProvider.notifier).cleanData(),
      syncAction: () => ref.read(objboxCharsProvider.notifier).syncRemote(),
      title: 'Objectbox Data',
      body: objboxDataAsync.when(
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
