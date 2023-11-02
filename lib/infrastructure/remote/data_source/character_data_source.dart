import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_local_storages/core/constants/urls.dart';
import 'package:flutter_local_storages/domain/character/character.dart';

abstract class ICharacterDataSource {
  Future<List<Character>> getCharacters();
}

@LazySingleton(as: ICharacterDataSource)
class CharacterDataSource implements ICharacterDataSource {
  final Dio client;

  const CharacterDataSource(this.client);

  @override
  Future<List<Character>> getCharacters() async {
    try {
      var response = await client.get(charactersUrl);
      final charList = <Character>[];
      for (var char in response.data['results']) {
        charList.add(Character.fromJson(char));
      }
      return charList;
    } catch (e) {
      return [];
    }
  }
}
