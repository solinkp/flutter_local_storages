import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_local_storages/di/injection.dart' as di;
import 'package:flutter_local_storages/core/constants/global.dart';
import 'package:flutter_local_storages/domain/hive/hive_char.dart';
import 'package:flutter_local_storages/presentation/screens/screens.dart';
import 'package:flutter_local_storages/infrastructure/local/cbl/repository/cbl_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/isar/repository/isar_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/drift/repository/drift_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/floor/repository/floor_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/realm/repository/realm_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/sqflite/repository/sqflite_repository.dart';
import 'package:flutter_local_storages/infrastructure/local/sembast/repository/sembast_repository.dart';
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
  //? Sembast
  await di.locator.isReady<ISembastRepository>();
  //? CBL
  await CouchbaseLiteFlutter.init();
  await di.locator.isReady<ICblRepository>();
  //? Realm
  await di.locator.isReady<IRealmRepository>();
  //? SQFLite
  await di.locator.isReady<ISqfLiteRepository>();
  //? Floor
  await di.locator.isReady<IFloorRepository>();
  //? Drift
  await di.locator.isReady<IDriftRepository>();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Storages',
      scaffoldMessengerKey: snackbarKey,
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
        '/sembast': (context) => const SembastScreen(),
        '/cbl': (context) => const CblScreen(),
        '/realm': (context) => const RealmScreen(),
        '/sqflite': (context) => const SqfLiteScreen(),
        '/floor': (context) => const FloorScreen(),
        '/drift': (context) => const DriftScreen(),
      },
    );
  }
}
