import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final bool hasSyncAction;
  final VoidCallback? clearAction;
  final VoidCallback? syncAction;

  const BaseLayout({
    super.key,
    required this.title,
    required this.body,
    this.hasSyncAction = false,
    this.clearAction,
    this.syncAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('baseLayoutScaffold'),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.teal,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: hasSyncAction
            ? [
                IconButton(
                  onPressed: clearAction,
                  icon: const Icon(Icons.cleaning_services_rounded),
                ),
                IconButton(
                  onPressed: syncAction,
                  icon: const Icon(Icons.sync_rounded),
                ),
              ]
            : null,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.teal,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: SafeArea(child: body)),
    );
  }
}
