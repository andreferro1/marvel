import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/character_model.dart';
import 'package:marvel_vrsoft/app/modules/character/widgets/character_appbar.dart';
import 'package:marvel_vrsoft/app/modules/character/widgets/character_modal_detail.dart';
import 'package:marvel_vrsoft/app/repositories/characters_repository.dart';
import 'package:marvel_vrsoft/app/shared/widgets/default_card.dart';
import 'package:marvel_vrsoft/app/shared/widgets/error_try_again.dart';
import 'character_controller.dart';

class CharacterPage extends StatefulWidget {
  final String title;

  const CharacterPage({Key key, this.title = "Character"}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState
    extends ModularState<CharacterPage, CharacterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: characterAppBar(),
      backgroundColor: Colors.black,
      body: Observer(
        builder: (_) => FutureBuilder(
          future: CharactersRepository.getCharacters(controller.search),
          builder:
              (BuildContext context, AsyncSnapshot<CharacterModel> snapshot) {
            controller.characterModel = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.done:
              case ConnectionState.active:
                return ListView.builder(
                    itemCount: controller.characterModel.data.results.length,
                    itemBuilder: (context, i) {
                      String pathThumb = controller.characterModel.data.results[i].thumbnail.path;
                      String extensionThumb = controller.characterModel.data.results[i].thumbnail.extension;
                      String urlThumb =  pathThumb + '/standard_large.' + extensionThumb;
                      return DefaultCard(
                        thumb: urlThumb,
                        title: controller.characterModel.data.results[i].name,
                        subTitle1: 'Amount of Comics: ' + controller.characterModel.data.results[i].comics.available.toString(),
                        subTitle2: 'Saved Comics: 0',
                        onTap: () {
                          characterModalDetail(
                              context,
                              controller.characterModel.data.results[i].id,
                              controller.characterModel,
                              urlThumb,
                              controller.characterModel.data.results[i].name,
                              controller.characterModel.data.results[i].comics.available.toString(),
                              controller.characterModel.data.results[i].description
                          );
                        },
                      );
                    });
                break;
              case ConnectionState.none:
                return ErrorTryAgain(
                  label: 'Error to Load Page',
                  onError: () =>
                      CharactersRepository.getCharacters(controller.search),
                );
                break;
              case ConnectionState.waiting:
              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}