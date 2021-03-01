import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/character_model.dart';
import 'package:marvel_vrsoft/app/shared/constants/api_connection.dart';

class CharactersRepository extends Disposable {
  static Future<CharacterModel> getCharacters(String search) async {
    print(search);
    Dio client = Dio();
    Response response = Response();

    String url = "$urlBase/characters?orderBy=name&limit=50$urlKey";

    try {
      if (search != '') {
        url += "&nameStartsWith=$search";
      }

      response = await client.get(url).timeout(Duration(seconds: 15));
      CharacterModel model = CharacterModel.fromJson(response.data);
      return model;
    } on DioError catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {}
}
