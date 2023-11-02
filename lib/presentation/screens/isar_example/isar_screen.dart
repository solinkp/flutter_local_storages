import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/application/isar/isar_provider.dart';
import 'package:flutter_local_storages/presentation/layouts/base_layout.dart';
import 'package:flutter_local_storages/presentation/widgets/character_item.dart';

class IsarScreen extends ConsumerWidget {
  const IsarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isarDataAsync = ref.watch(isarCharsProvider);

    return BaseLayout(
      hasSyncAction: true,
      syncAction: () => ref.read(isarCharsProvider.notifier).syncRemote(),
      title: 'Isar Data',
      body: isarDataAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error')),
        data: (data) => data.isEmpty
            ? const Center(child: Text('Empty Data'))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) => CharacterItem(char: data[index]),
              ),
      ),
    );
  }
}
