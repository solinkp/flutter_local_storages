import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:flutter_local_storages/domain/drift/drift_char.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [DriftChar])
class DriftDB extends _$DriftDB {
  DriftDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'drift_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
