import 'package:flutter_local_storages/domain/storage_item/storage_item.dart';

const List<StorageItem> noSqlStorageItems = [
  StorageItem(name: 'Isar'),
  StorageItem(name: 'Hive'),
  StorageItem(name: 'Objectbox'),
  StorageItem(name: 'Sembast'),
  StorageItem(name: 'CBL'),
  StorageItem(name: 'Realm'),
];

const List<StorageItem> sqlStorageItems = [
  StorageItem(name: 'SQFLite'),
  StorageItem(name: 'Floor'),
  StorageItem(name: 'Drift'),
];
