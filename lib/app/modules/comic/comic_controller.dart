import 'package:flutter/cupertino.dart';
import 'package:marvel_vrsoft/app/models/comic_model.dart';
import 'package:marvel_vrsoft/app/repositories/characters_repository.dart';
import 'package:marvel_vrsoft/app/repositories/comic_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'comic_controller.g.dart';

@Injectable()
class ComicController = _ComicControllerBase with _$ComicController;

abstract class _ComicControllerBase with Store {
  List<ComicModel> comicModel;

  @observable
  bool isSearching = false;

  @observable
  String search = "";

  @observable
  TextEditingController controller = TextEditingController();

  @action
  void searchAcion() {
    if (isSearching) {
      search = "";
      controller.text = "";
      ComicRepository.getComics(search);
    } else {
      isSearching = true;
    }
  }

  @action
  void searchChangeQuery(String value) {
    search = value;
    ComicRepository.getComics(search);
  }

  @action
  void searchBack() {
    if (isSearching == true) controller.text = "";
    search = "";
    isSearching = false;
    ComicRepository.getComics(search);
  }
}
