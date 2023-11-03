import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_local_storages/di/injection.config.dart';
import 'package:flutter_local_storages/core/constants/global.dart';
import 'package:flutter_local_storages/domain/isar/isar_char.dart';
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
  HiveInterface get hive {
    return Hive;
  }
}
