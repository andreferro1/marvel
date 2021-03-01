import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/creator_comic_model.dart';
import 'package:marvel_vrsoft/app/shared/constants/api_connection.dart';

class CreatorComicRepository extends Disposable {
  static Future<CreatorComicModel> getCreatorComicRepository(String id) async {
    Dio client = Dio();
    Response response;

    String url = "$urlBase/creators/$id/comics?$urlKey";
    print(url);

    try {
      response = await client.get(url).timeout(Duration(seconds: 15));
      CreatorComicModel model = CreatorComicModel.fromJson(response.data);
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
