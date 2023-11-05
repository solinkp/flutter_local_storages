import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/presentation/layouts/base_layout.dart';
import 'package:flutter_local_storages/presentation/widgets/character_item.dart';
import 'package:flutter_local_storages/application/objectbox/objectbox_provider.dart';

class ObjectboxScreen extends ConsumerWidget {
  const ObjectboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var objboxDataAsync = ref.watch(objboxCharsProvider);

    return BaseLayout(
      hasSyncAction: true,
      syncAction: () => ref.read(objboxCharsProvider.notifier).syncRemote(),
      title: 'Objectbox Data',
      body: objboxDataAsync.when(
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
