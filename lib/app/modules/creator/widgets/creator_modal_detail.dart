import 'package:flutter/material.dart';
import 'package:marvel_vrsoft/app/models/creator_comic_model.dart';
import 'package:marvel_vrsoft/app/models/creator_model.dart';
import 'package:marvel_vrsoft/app/repositories/creator_comic_repository.dart';
import 'package:marvel_vrsoft/app/shared/constants/styles.dart';
import 'package:marvel_vrsoft/app/shared/widgets/default_card.dart';

void creatorModalDetail(BuildContext context, String id, CreatorModel model,
    String thumb, String name, String amountComics) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultCard(
                      thumb: thumb,
                      title: name,
                      subTitle1: 'Amount of Comics: ' + amountComics,
                      subTitle2: '',
                    ),
                    SizedBox(height: 20,),
                    Center(
                        child: Text(
                          "Creator's Comics",
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              letterSpacing: 2,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                              future: CreatorComicRepository.getCreatorComicRepository(id),
                              builder: (context, AsyncSnapshot<CreatorComicModel> snapshot) {
                                if(snapshot.data != null){
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.data.results.length,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 15, right: 8, bottom: 13),
                                        child: GestureDetector(
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  snapshot.data.data.results[i].thumbnail.path + '/portrait_xlarge.' + snapshot.data.data.results[i].thumbnail.extension,
                                                  height: 200,
                                                  width: 125,
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return Center(child: CircularProgressIndicator(),);
                              }
                          ),
                        ))
                  ],
                ),
              )),
        );
      });
}
