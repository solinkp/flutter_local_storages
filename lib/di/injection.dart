import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:realm/realm.dart';
import 'package:get_it/get_it.dart';
import 'package:cbl/cbl.dart' as cbl;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_local_storages/objectbox.g.dart';
import 'package:flutter_local_storages/di/injection.config.dart';
import 'package:flutter_local_storages/core/constants/global.dart';
import 'package:flutter_local_storages/domain/isar/isar_char.dart';
import 'package:flutter_local_storages/domain/realm/realm_char.dart';
import 'package:flutter_local_storages/core/utils/interceptor/dio_interceptor.dart';

//* Get instance of GetIt.
final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configure() async => $initGetIt(locator);

@module
abstract class RegisterModule {
  //* Register Dio module
  @lazySingleton
  Dio get client {
    final options = BaseOptions(
      sendTimeout: const Duration(seconds: 60),
    );
    Dio dio = Dio(options)..addInterceptors();
    return dio;
  }

  //* Register Isar module
  @lazySingleton
  Future<Isar> get isar async {
    var dir = await globalAppDocDir;
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [IsarCharSchema],
        name: 'isarRickMorty',
        directory: dir,
      );
    }
    return Future.value(Isar.getInstance('isarRickMorty'));
  }

  //* Register Hive module
  @lazySingleton
  HiveInterface get hive => Hive;

  //* Register Objectbox module
  @lazySingleton
  Future<Store> get store async {
    var dir = await globalAppDocDir;
    return Store(
      getObjectBoxModel(),
      directory: join(dir, "obx-example"),
    );
  }

  //* Register Sembast module
  @lazySingleton
  Future<Database> get sembastDB async {
    var dir = await globalAppDocDir;
    var databasePath = join(dir, "sembast.db");
    return await databaseFactoryIo.openDatabase(databasePath);
  }

  @lazySingleton
  Future<StoreRef> get sembCharacterStore async {
    return intMapStoreFactory.store("character_store");
  }

  //* Register CBL module
  @lazySingleton
  Future<cbl.Database> get cblDB async {
    var dir = await globalAppDocDir;
    return await cbl.Database.openAsync(
      'cbl-db',
      cbl.DatabaseConfiguration(directory: dir),
    );
  }

  //* Register Realm module
  @lazySingleton
  Future<Realm> get realm async {
    var config = Configuration.local([RealmChar.schema]);
    return Realm(config);
  }
}
