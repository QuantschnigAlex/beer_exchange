/**
 * Home of the application
 * Author: Alex Quantschnig
 * Date: 2023-03-06
 * Version: 1.0.0
 * ToDo - Add a gif to the background
 * ToDo - Out Comment the Audiplayer in the bierPriceCalc
 * ToDo 2.50 limit
 */
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:beer_exchange/colors.dart';
import 'package:beer_exchange/widgets/ad_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/progress_indicator.dart';

final bierCount = StateProvider<int>((_) => 0);
final percentInBier = StateProvider<double>((_) => 0.00);
final priceOfBeer = StateProvider<double>((_) => 4.30);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double bierPrice = ref.watch(priceOfBeer);
    final double beerPercent = ref.watch(percentInBier);
    final int bierCounter = ref.watch(bierCount);
    final scrennHeight =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background1,
      appBar: AppBar(
        title: const Text('Bier Börse by Restaurant Riepl'),
        backgroundColor: appBarColors,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          height: scrennHeight,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ProgressBar(beerPercent: beerPercent),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: scrennHeight * 0.2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 3,
                            color: cardBackground,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bier Preis: ${bierPrice.toStringAsFixed(2)}€",
                                    style: TextStyle(
                                        color: textColor, fontSize: 36),
                                  ),
                                  Text(
                                    "Bier Anzahl: ${bierCounter.toString()}",
                                    style: TextStyle(
                                        color: textColor, fontSize: 36),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AdBar(beerPrice: bierPrice, beerCount: bierCounter),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              ref.read(bierCount.notifier).state++;
                              bierPriceCalc(
                                  bierCounter, ref, bierPrice, beerPercent);
                            },
                            icon: Icon(
                              Icons.add_box_rounded,
                              color: textColor,
                              size: 36,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(bierCount.notifier).state--;
                              bierPriceDecrease(
                                  bierCounter, ref, bierPrice, beerPercent);
                            },
                            icon: Icon(
                              Icons.remove_circle_rounded,
                              color: textColor,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "© Alex Quantschnig",
                        style: TextStyle(fontSize: 12, color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bierPriceCalc(
      int bierCounter, WidgetRef ref, double bierPrice, double beerPercent) {
    if (bierCounter > 0 && bierCounter % 20 == 0) {
      AudioPlayer().play(AssetSource('audio/bell.mp3'), volume: 100);
      ref.read(priceOfBeer.notifier).state = bierPrice - 0.10;
      ref.read(percentInBier.notifier).state = 0.05;
    } else {
      double currentAmount = beerPercent + 0.05;
      currentAmount = dp(currentAmount, 2);
      ref.read(percentInBier.notifier).state = currentAmount;
    }
  }

  void bierPriceDecrease(
      int bierCounter, WidgetRef ref, double bierPrice, double beerPercent) {
    if (bierCounter > 0 && bierCounter % 20 == 0) {
      ref.read(priceOfBeer.notifier).state = bierPrice + 0.10;
      ref.read(percentInBier.notifier).state = 0.05;
    } else {
      double currentAmount = beerPercent - 0.05;
      currentAmount = dp(currentAmount, 2);
      ref.read(percentInBier.notifier).state = currentAmount;
    }
  }

  double dp(double val, int places) {
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }
}
