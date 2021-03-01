import 'package:flutter/material.dart';
import 'package:marvel_vrsoft/app/models/creator_model.dart';
import 'package:marvel_vrsoft/app/repositories/creator_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'creator_controller.g.dart';

@Injectable()
class CreatorController = _CreatorControllerBase with _$CreatorController;

abstract class _CreatorControllerBase with Store {
  CreatorModel creatorModel;

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
      CreatorRepository.getCreators(search);
    } else {
      isSearching = true;
    }
  }

  @action
  void searchChangeQuery(String value) {
    search = value;
    CreatorRepository.getCreators(search);
  }

  @action
  void searchBack() {
    if (isSearching == true) controller.text = "";
    search = "";
    isSearching = false;
    CreatorRepository.getCreators(search);
  }

  @action
  Future<CreatorModel> getCreators() async{

    return creatorModel = await CreatorRepository.getCreators(search);
  }
}
