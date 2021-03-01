import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/comic_model.dart';
import 'package:marvel_vrsoft/app/modules/comic/comic_controller.dart';
import 'package:marvel_vrsoft/app/modules/comic/widgets/comic_appbar.dart';
import 'package:marvel_vrsoft/app/repositories/comic_repository.dart';
import 'package:marvel_vrsoft/app/shared/widgets/default_card.dart';
import 'package:marvel_vrsoft/app/shared/widgets/error_try_again.dart';

class ComicPage extends StatelessWidget {
  final ComicController c = Modular.get<ComicController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: comicAppBar(),
      backgroundColor: Colors.black,
      body: Observer(
        builder: (_) => FutureBuilder(
          future: ComicRepository.getComics(c.search),
          builder:
              (BuildContext context, AsyncSnapshot<List<ComicModel>> snapshot) {
                c.comicModel = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.done:
              case ConnectionState.active:
                return ListView.builder(
                    itemCount: c.comicModel.length,
                    itemBuilder: (context, i) {
                      String pathThumb = c.comicModel[i].thumbPath;
                      String extensionThumb = c.comicModel[i].thumbExtension;
                      String urlThumb = pathThumb + '/standard_large.' + extensionThumb;
                      return DefaultCard(
                        thumb: urlThumb,
                        title: c.comicModel[i].title,
                        subTitle1: c.comicModel[i].series,
                        subTitle2: c.comicModel[i].creator,
                      );
                    });
                break;
              case ConnectionState.none:
                return ErrorTryAgain(
                  label: 'Error to Load Page',
                  onError: () => ComicRepository.getComics(c.search),
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
