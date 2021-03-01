import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvel_vrsoft/app/shared/constants/styles.dart';

class ErrorMessageDefault extends StatelessWidget {
  final String title;

  const ErrorMessageDefault({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.frown,
              size: 17,
              color: SECOND_COLOR,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Oops!',
              style: TextStyle(color: SECOND_COLOR),
            ),
          ],
        ),
        SizedBox(
          height: 7.0,
        ),
        Text(
          title,
          style: TextStyle(color: SECOND_COLOR),
        ),
      ],
    );
  }
}
