import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/presentation/widgets/loader.dart';
import 'package:flutter_local_storages/presentation/widgets/data_text.dart';
import 'package:flutter_local_storages/application/realm/realm_provider.dart';
import 'package:flutter_local_storages/presentation/layouts/base_layout.dart';
import 'package:flutter_local_storages/presentation/widgets/character_item.dart';
import 'package:flutter_local_storages/presentation/widgets/custom_gridview.dart';

class RealmScreen extends ConsumerWidget {
  const RealmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var realmDataAsync = ref.watch(realmCharsProvider);

    return BaseLayout(
      hasSyncAction: true,
      clearAction: () => ref.read(realmCharsProvider.notifier).cleanData(),
      syncAction: () => ref.read(realmCharsProvider.notifier).syncRemote(),
      title: 'Realm Data',
      body: realmDataAsync.when(
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
