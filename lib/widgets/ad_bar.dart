import 'package:beer_exchange/colors.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AdBar extends StatelessWidget {
  final double beerPrice;
  final int beerCount;
  const AdBar({super.key, required this.beerPrice, required this.beerCount});
//"Bier Börse by Restaurant Riepl  -  Sponsored by Puntigamer  -  Developed by Alex Quantschnig  -  Bierpreis: $beerPrice€  -  Bieranzahl: $beerCount"
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scrennHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    return Container(
      height: scrennHeight * 0.1,
      width: screenWidth,
      color: appBarColors,
      child: Center(
        child: Marquee(
          text:
              "Bier Börse by Restaurant Riepl  -  Sponsored by Puntigamer  -  Developed by Alex Quantschnig  -  Bierpreis: $beerPrice€  -  Bieranzahl: $beerCount",
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          blankSpace: 20.0,
          velocity: 100.0,
          pauseAfterRound: const Duration(seconds: 0),
          startPadding: 10.0,
          accelerationDuration: const Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: const Duration(milliseconds: 0),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}
