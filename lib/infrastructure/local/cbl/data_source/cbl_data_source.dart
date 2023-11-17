import 'package:cbl/cbl.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/domain/character/character.dart';

abstract class ICblDataSource {
  Future<List<Map<String, dynamic>>> getCblCharacters();
  Future<void> saveCblCharacters(List<Character> characters);
  Future<void> cleanData();
}

@LazySingleton(as: ICblDataSource)
class CblDataSource implements ICblDataSource {
  final Database _cblDB;

  const CblDataSource(this._cblDB);

  @override
  Future<List<Map<String, dynamic>>> getCblCharacters() async {
    final query = const QueryBuilder()
        .select(SelectResult.all())
        .from(DataSource.database(_cblDB));

    final results = await (await query.execute()).allResults();
    return results.map((e) => e.dictionary('cbl-db')!.toPlainMap()).toList();
  }

  @override
  Future<void> saveCblCharacters(List<Character> characters) async {
    cleanData();
    for (var character in characters) {
      var doc = MutableDocument.withId('${character.id}', character.toJson());
      await _cblDB.saveDocument(doc);
    }
  }

  @override
  Future<void> cleanData() async {
    final allChars = await getCblCharacters();
    for (var char in allChars) {
      var doc = await _cblDB.document('${char['id']}');
      if (doc != null) {
        await _cblDB.deleteDocument(doc);
      }
    }
  }
}
