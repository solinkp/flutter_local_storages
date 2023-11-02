import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/di/injection.dart' as di;
import 'package:flutter_local_storages/presentation/screens/screens.dart';
import 'package:flutter_local_storages/infrastructure/local/isar/repository/isar_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.configure();

  //? isar init
  await _initLocalServices();

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _initLocalServices() async {
  await di.locator.isReady<IIsarRepository>();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Storages',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/isar': (context) => const IsarScreen(),
      },
    );
  }
}
