import 'package:beer_exchange/colors.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AdBar extends StatelessWidget {
  final double beerPrice;
  final int beerCount;
  const AdBar({super.key, required this.beerPrice, required this.beerCount});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: appBarColors,
        height: 120,
        child: Marquee(
          text:
              "Bier Börse by Restaurant Riepl  -  Puntigamer  -  Präsentiert von:  Didi | Alex | Stefan  -  Bürgermeister: Arnold Marbek  -  ♥️ Poggersdorf  -  www.restaurant-riepl.at  -  mail@restaurant-riepl.at  -  Bier trinken  -  Es trinkt der Mensch es säuft das Pferd: nur heute ist es umgekehrt.  -  Lass dich nicht lumpen, hoch den Humpen!  -  Stößchen! Wie man unter Männern sagt.",
          style: TextStyle(
            color: textColor,
            fontSize: 36,
          ),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          blankSpace: 20.0,
          velocity: 100.0,
          startPadding: 10.0,
          accelerationCurve: Curves.linear,
        ),
      ),
    );
  }
}
