import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/di/injection.dart' as di;
import 'package:flutter_local_storages/core/constants/global.dart';
import 'package:flutter_local_storages/domain/hive/hive_char.dart';
import 'package:flutter_local_storages/presentation/screens/screens.dart';
import 'package:flutter_local_storages/infrastructure/local/isar/repository/isar_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/objectbox/repository/objectbox_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.configure();

  //? local storages init
  await _initLocalServices();

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _initLocalServices() async {
  //? Isar
  await di.locator.isReady<IIsarRepository>();
  //? Hive
  var dir = await globalAppDocDir;
  await Hive.initFlutter(dir);
  Hive.registerAdapter<HiveChar>(HiveCharAdapter());
  Hive.registerAdapter(HiveStatusAdapter());
  Hive.registerAdapter(HiveGenderAdapter());
  await Hive.openBox<HiveChar>('HiveCharBox');
  //? Objectbox
  await di.locator.isReady<IObjectboxRepository>();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Local Storages',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          onPrimary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/isar': (context) => const IsarScreen(),
        '/hive': (context) => const HiveScreen(),
        '/objectbox': (context) => const ObjectboxScreen(),
      },
    );
  }
}
