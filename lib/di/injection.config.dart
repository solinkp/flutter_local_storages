// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cbl/cbl.dart' as _i4;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i22;
import 'package:realm/realm.dart' as _i23;
import 'package:sembast/sembast.dart' as _i6;
import 'package:sqflite/sqflite.dart' as _i5;

import '../core/database/drift_db.dart' as _i8;
import '../core/database/floor_db.dart' as _i3;
import '../infrastructure/local/cbl/data_source/cbl_data_source.dart' as _i10;
import '../infrastructure/local/cbl/repository/cbl_repository.dart' as _i11;
import '../infrastructure/local/drift/data_source/drift_data_source.dart' as _i14;
import '../infrastructure/local/drift/repository/drift_repository.dart' as _i15;
import '../infrastructure/local/floor/data_source/floor_data_source.dart' as _i16;
import '../infrastructure/local/floor/repository/floor_repository.dart' as _i17;
import '../infrastructure/local/hive/data_source/hive_data_source.dart' as _i18;
import '../infrastructure/local/hive/repository/hive_repository.dart' as _i19;
import '../infrastructure/local/isar/data_source/isar_data_source.dart' as _i25;
import '../infrastructure/local/isar/repository/isar_repository.dart' as _i26;
import '../infrastructure/local/objectbox/data_source/objectbox_data_source.dart'
    as _i27;
import '../infrastructure/local/objectbox/repository/objectbox_repository.dart'
    as _i28;
import '../infrastructure/local/realm/data_source/realm_data_source.dart' as _i29;
import '../infrastructure/local/realm/repository/realm_repository.dart' as _i30;
import '../infrastructure/local/sembast/data_source/sembast_data_source.dart'
    as _i31;
import '../infrastructure/local/sembast/repository/sembast_repository.dart'
    as _i32;
import '../infrastructure/local/sqflite/data_source/sqflite_data_source.dart'
    as _i20;
import '../infrastructure/local/sqflite/repository/sqflite_repository.dart'
    as _i21;
import '../infrastructure/remote/data_source/character_data_source.dart' as _i12;
import '../infrastructure/remote/repository/character_repository.dart' as _i13;
import '../objectbox.g.dart' as _i24;
import 'injection.dart' as _i33;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingletonAsync<_i3.AppDB>(() => registerModule.floorDb);
  gh.lazySingletonAsync<_i4.Database>(() => registerModule.cblDB);
  gh.lazySingletonAsync<_i5.Database>(() => registerModule.sqfliteDb);
  gh.lazySingletonAsync<_i6.Database>(() => registerModule.sembastDB);
  gh.lazySingleton<_i7.Dio>(() => registerModule.client);
  gh.lazySingletonAsync<_i8.DriftDB>(() => registerModule.driftDb);
  gh.lazySingleton<_i9.HiveInterface>(() => registerModule.hive);
  gh.lazySingletonAsync<_i10.ICblDataSource>(
      () async => _i10.CblDataSource(await gh.getAsync<_i4.Database>()));
  gh.lazySingletonAsync<_i11.ICblRepository>(
      () async => _i11.CblRepository(await gh.getAsync<_i10.ICblDataSource>()));
  gh.lazySingleton<_i12.ICharacterDataSource>(
      () => _i12.CharacterDataSource(gh<_i7.Dio>()));
  gh.lazySingleton<_i13.ICharacterRepository>(
      () => _i13.CharacterRepository(gh<_i12.ICharacterDataSource>()));
  gh.lazySingletonAsync<_i14.IDriftDataSource>(
      () async => _i14.DriftDataSource(await gh.getAsync<_i8.DriftDB>()));
  gh.lazySingletonAsync<_i15.IDriftRepository>(() async =>
      _i15.DriftRepository(await gh.getAsync<_i14.IDriftDataSource>()));
  gh.lazySingletonAsync<_i16.IFloorDataSource>(
      () async => _i16.FloorDataSource(await gh.getAsync<_i3.AppDB>()));
  gh.lazySingletonAsync<_i17.IFloorRepository>(() async =>
      _i17.FloorRepository(await gh.getAsync<_i16.IFloorDataSource>()));
  gh.lazySingleton<_i18.IHiveDataSource>(
      () => _i18.HiveDataSource(gh<_i9.HiveInterface>()));
  gh.lazySingleton<_i19.IHiveRepository>(
      () => _i19.HiveRepository(gh<_i18.IHiveDataSource>()));
  gh.lazySingletonAsync<_i20.ISqfLiteDataSource>(
      () async => _i20.SqfLiteDataSource(await gh.getAsync<_i5.Database>()));
  gh.lazySingletonAsync<_i21.ISqfLiteRepository>(() async =>
      _i21.SqfLiteRepository(await gh.getAsync<_i20.ISqfLiteDataSource>()));
  gh.lazySingletonAsync<_i22.Isar>(() => registerModule.isar);
  gh.lazySingletonAsync<_i23.Realm>(() => registerModule.realm);
  gh.lazySingletonAsync<_i24.Store>(() => registerModule.store);
  gh.lazySingletonAsync<_i6.StoreRef<Object?, Object?>>(
      () => registerModule.sembCharacterStore);
  gh.lazySingletonAsync<_i25.IIsarDataSource>(
      () async => _i25.IsarDataSource(await gh.getAsync<_i22.Isar>()));
  gh.lazySingletonAsync<_i26.IIsarRepository>(
      () async => _i26.IsarRepository(await gh.getAsync<_i25.IIsarDataSource>()));
  gh.lazySingletonAsync<_i27.IObjectboxDataSource>(
      () async => _i27.ObjectboxDataSource(await gh.getAsync<_i24.Store>()));
  gh.lazySingletonAsync<_i28.IObjectboxRepository>(() async =>
      _i28.ObjectboxRepository(await gh.getAsync<_i27.IObjectboxDataSource>()));
  gh.lazySingletonAsync<_i29.IRealmDataSource>(
      () async => _i29.RealmDataSource(await gh.getAsync<_i23.Realm>()));
  gh.lazySingletonAsync<_i30.IRealmRepository>(() async =>
      _i30.RealmRepository(await gh.getAsync<_i29.IRealmDataSource>()));
  gh.lazySingletonAsync<_i31.ISembastDataSource>(
      () async => _i31.SembastDataSource(
            await gh.getAsync<_i6.Database>(),
            await gh.getAsync<_i6.StoreRef<Object?, Object?>>(),
          ));
  gh.lazySingletonAsync<_i32.ISembastRepository>(() async =>
      _i32.SembastRepository(await gh.getAsync<_i31.ISembastDataSource>()));
  return getIt;
}

class _$RegisterModule extends _i33.RegisterModule {}
