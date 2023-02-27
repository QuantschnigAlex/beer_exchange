import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

final AMOUNT_BIER = StateProvider<int>((_) => 0);
final BIER_PRICE = StateProvider<double>((_) => 4.50);

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BEER_DECREASE = 0.01;
    double bierPrice = ref.watch(BIER_PRICE);
    final int value = ref.watch(AMOUNT_BIER);
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Beer Exchange')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: FAProgressBar(
              size: 100,
              displayTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 30),
              currentValue: value.toDouble(),
              displayText: '',
              progressColor: Colors.green,
            ),
          ),
          SizedBox(
            child: Text(
              'Aktueller Preis: ${bierPrice.toStringAsFixed(1)}€',
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Container(
            color: Colors.white,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Anzahl Bier',
              ),
              controller: controller,
              onSubmitted: (value) {
                ref.read(AMOUNT_BIER.notifier).state +=
                    int.parse(controller.text);
                ref.read(BIER_PRICE.notifier).state -=
                    (int.parse(controller.text) * BEER_DECREASE);
                controller.clear();
              },
            ),
          ),
        ],
      )),
    );
  }
}
