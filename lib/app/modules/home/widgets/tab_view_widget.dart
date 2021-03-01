import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvel_vrsoft/app/shared/constants/styles.dart';

Widget tabViewWidget(TabController _tabController) {
  return BottomAppBar(
    child: Container(
      child: TabBar(
        labelColor: PRIMARY_COLOR,
        labelPadding: EdgeInsets.all(0),
        unselectedLabelColor: Colors.white,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3, color: PRIMARY_COLOR)),
        tabs: [
          tabIcon(label: 'Characters', icon: FontAwesomeIcons.user),
          tabIcon(label: 'Creators', icon: FontAwesomeIcons.pencilAlt),
          tabIcon(label: 'Comics', icon: FontAwesomeIcons.bookReader),
        ],
        controller: _tabController,
      ),
    ),
  );
}

Widget tabIcon({String label, IconData icon}) {
  return Container(
    padding: EdgeInsets.only(top: 11),
    height: 60,
    child: Tab(
        child: Column(
      children: [
        Icon(
          icon,
          size: 17,
        ),
        SizedBox(
          height: 10,
        ),
        Text(label)
      ],
    )),
  );
}
