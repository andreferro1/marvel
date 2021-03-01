import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/models/creator_model.dart';
import 'package:marvel_vrsoft/app/modules/creator/creator_controller.dart';
import 'package:marvel_vrsoft/app/modules/creator/widgets/creator_appbar.dart';
import 'package:marvel_vrsoft/app/modules/creator/widgets/creator_modal_detail.dart';
import 'package:marvel_vrsoft/app/shared/widgets/default_card.dart';
import 'package:marvel_vrsoft/app/shared/widgets/error_try_again.dart';

class CreatorPage extends StatelessWidget {
  final CreatorController c = Modular.get<CreatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: creatorAppBar(),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: c.getCreators(),
        builder:
            (BuildContext context, AsyncSnapshot<CreatorModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            default:
              if (snapshot.hasError) {
                return ErrorTryAgain(
                  label: 'Error to Load Page',
                );
              } else {
                return ListView.builder(
                    itemCount: c.creatorModel.data.results.length,
                    itemBuilder: (context, i) {
                      String pathThumb =
                          c.creatorModel.data.results[i].thumbnail.path;
                      String extensionThumb =
                          c.creatorModel.data.results[i].thumbnail.extension;
                      String urlThumb =
                          pathThumb + '/standard_large.' + extensionThumb;
                      return DefaultCard(
                        thumb: urlThumb,
                        title: c.creatorModel.data.results[i].fullName,
                        subTitle1: 'Amount of Comics: ' +
                            c.creatorModel.data.results[i].comics.available
                                .toString(),
                        subTitle2: 'Saved Comics: 0',
                        onTap: () => creatorModalDetail(
                          context,
                            c.creatorModel.data.results[i].id.toString(),
                            c.creatorModel,
                            urlThumb,
                            c.creatorModel.data.results[i].fullName,
                            c.creatorModel.data.results[i].comics.available.toString(),
                        ),
                      );
                    });
              }
          }
        },
      ),
    );
  }
}
