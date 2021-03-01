import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class AvatarLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 20.0),
      child: AvatarGlow(
          endRadius: 65,
          duration: Duration(seconds: 2),
          glowColor: Colors.white24,
          repeat: true,
          repeatPauseDuration: Duration(seconds: 1),
          startDelay: Duration(seconds: 1),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(50.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'lib/img/ic_marvel.png',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}
