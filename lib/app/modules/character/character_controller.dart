import 'package:flutter/material.dart';
import 'package:marvel_vrsoft/app/models/character_model.dart';
import 'package:marvel_vrsoft/app/repositories/characters_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'character_controller.g.dart';

@Injectable()
class CharacterController = _CharacterControllerBase with _$CharacterController;

abstract class _CharacterControllerBase with Store {
  CharacterModel characterModel;

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
      CharactersRepository.getCharacters(search);
    } else {
      isSearching = true;
    }
  }

  @action
  void searchChangeQuery(String value) {
    search = value;
    CharactersRepository.getCharacters(search);
  }

  @action
  void searchBack() {
    if (isSearching == true) controller.text = "";
    search = "";
    isSearching = false;
    CharactersRepository.getCharacters(search);
  }
}
