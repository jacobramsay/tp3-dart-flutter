import 'package:flutter/material.dart';
import 'package:tp3/app/model/cardModel.dart';

class TrainingCardWidget extends StatelessWidget {
  final CardModel cardModel;

  TrainingCardWidget({CardModel cardModel}) : cardModel = cardModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FittedBox(
        child: Center(
          child: Text(
            cardModel.symbol,
          ),
        ),
      ),
    );
  }
}
