import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/comic_model.dart';
import 'package:marvel_vrsoft/app/shared/constants/api_connection.dart';

class ComicRepository extends Disposable {
  static Future<List<ComicModel>> getComics(String search) async {
    print(search);
    Dio client = Dio();
    Response response = Response();

    String url = "$urlBase/comics?orderBy=title&limit=20&$urlKey";

    try {
      if (search != '') {
        url += "&titleStartsWith=$search";
      }

      response = await client.get(url).timeout(Duration(seconds: 15));
      List<ComicModel> listModel = [];
      for (int i = 0; i < response.data['data']['results'].length; i++) {
        listModel.add(ComicModel(
            thumbPath: response.data['data']['results'][i]['thumbnail']['path'],
            thumbExtension: response.data['data']['results'][i]['thumbnail']
                ['extension'],
            title: response.data['data']['results'][i]['title'],
            creator: response.data['data']['results'][i]['creators']['items']
                        .toString() !=
                    '[]'
                ? response.data['data']['results'][i]['creators']['items'][0]
                    ['name']
                : 'Not Listed',
            series: response.data['data']['results'][0]['series']['name']));
      }
      print(listModel.length);
      return listModel;
    } on DioError catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {}
}
