import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/character_comic_model.dart';
import 'package:marvel_vrsoft/app/shared/constants/api_connection.dart';

class CharacterComicRepository extends Disposable {
  static Future<CharacterComicModel> getCharacterComic(int id) async {
    Dio client = Dio();
    Response response;

    String url = "$urlBase/characters/$id/comics?$urlKey";
    print(url);

    try{
      response = await client.get(url).timeout(Duration(seconds: 15));
      CharacterComicModel model = CharacterComicModel.fromJson(response.data);
      return model;
    }on DioError catch(e){
      print(e.toString());
    } catch(e){
      print(e.toString());
    }



  }

  @override
  void dispose() {}
}
