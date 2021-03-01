import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/creator_model.dart';
import 'package:marvel_vrsoft/app/shared/constants/api_connection.dart';

class CreatorRepository extends Disposable {
  static Future<CreatorModel> getCreators(String search) async {
    print(search);
    Dio client = Dio();
    Response response = Response();

    String url = "$urlBase/creators?orderBy=lastName&limit=20$urlKey";

    try {
      if (search != '') {
        url += "&nameStartsWith=$search";
      }
      response = await client.get(url).timeout(Duration(seconds: 15));
      CreatorModel model = CreatorModel.fromJson(response.data);
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
