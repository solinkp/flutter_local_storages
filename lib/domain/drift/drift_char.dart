import 'package:drift/drift.dart';

class DriftChar extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get type => text()();
  TextColumn get gender => text()();
  TextColumn get image => text()();
  TextColumn get origin => text()();
}
