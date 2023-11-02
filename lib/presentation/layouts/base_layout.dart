import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final bool hasSyncAction;
  final VoidCallback? syncAction;

  const BaseLayout({
    super.key,
    required this.title,
    required this.body,
    this.hasSyncAction = false,
    this.syncAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('baseLayoutScaffold'),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: hasSyncAction
            ? [IconButton(onPressed: syncAction, icon: const Icon(Icons.sync))]
            : null,
      ),
      body: SafeArea(child: body),
    );
  }
}
