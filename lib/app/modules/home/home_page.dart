import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/modules/character/character_page.dart';
import 'package:marvel_vrsoft/app/modules/comic/comic_page.dart';
import 'package:marvel_vrsoft/app/modules/creator/creator_page.dart';
import 'package:marvel_vrsoft/app/modules/home/widgets/tab_view_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "MARVEL"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> with SingleTickerProviderStateMixin  {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CharacterPage(),
          CreatorPage(),
          ComicPage(),
        ],
      ),
      bottomNavigationBar: tabViewWidget(_tabController),
    );
  }
}
