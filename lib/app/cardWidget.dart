import 'package:flutter/material.dart';
import 'package:tp3/app/model/cardModel.dart';

class CardWidget extends StatelessWidget {
  final CardModel _cardModel;

  CardWidget({CardModel cardModel}) : _cardModel = cardModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        child: Column(
          children: < Widget > [
            Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  _cardModel.symbol,
                  textScaleFactor: 8,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Center(
                child: Text(
                  _cardModel.translation,
                  textScaleFactor: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
