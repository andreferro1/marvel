import 'package:flutter/material.dart';

import 'error_message_default.dart';

class ErrorTryAgain extends StatelessWidget {
  final String label;
  final Function onError;

  const ErrorTryAgain({Key key, this.label, this.onError}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ErrorMessageDefault(
            title: label,
          ),
          SizedBox(height: 10,),
          RaisedButton(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.autorenew,
                    color: Colors.white,
                    size: 17,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  InkWell(
                    child: Text(
                      'Try Again',
                      style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    ),
                    onTap: onError,
                  )
                ],
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
