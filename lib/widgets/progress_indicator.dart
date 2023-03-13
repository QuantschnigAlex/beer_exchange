import 'package:beer_exchange/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  final double beerPercent;
  const ProgressBar({super.key, required this.beerPercent});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CircularPercentIndicator(
      radius: screenWidth * 0.15,
      lineWidth: 18.0,
      percent: beerPercent,
      center: Image.asset(
        "assets/images/logo_riepl_white.png",
      ),
      progressColor: cardBackground,
    );
  }
}
