import 'package:flutter/material.dart';
import 'package:tp3/app/model/cardModel.dart';
import 'package:tp3/app/training/TrainingCardWidget.dart';
import 'dart:math';

class TrainingWidget extends StatefulWidget {
  final List<CardModel> _listCardModel;

  TrainingWidget(List<CardModel> listCardModel)
      : _listCardModel = listCardModel;

  @override
  State<StatefulWidget> createState() {
    return _TrainingWidgetState();
  }
}

class _TrainingWidgetState extends State<TrainingWidget> {
  final _random = new Random();
  bool _isFirstButtonDisabled = false;
  bool _isSecondButtonDisabled = false;
  bool _isThirdButtonDisabled = false;
  TrainingCardWidget _trainingCardWidget;
  List<CardModel> _listPossibleCards = new List<CardModel>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 3; i++) {
      _listPossibleCards.add(
          widget._listCardModel[_random.nextInt(widget._listCardModel.length)]);
    }
    _trainingCardWidget = new TrainingCardWidget(
        cardModel:
            _listPossibleCards[_random.nextInt(_listPossibleCards.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(child: _trainingCardWidget),
        FlatButton(
          child: Text(
            _listPossibleCards.first.translation,
            textScaleFactor: 2,
          ),
          textColor: _isFirstButtonDisabled ? Colors.red : Colors.black,
          onPressed: () => _isFirstButtonDisabled
              ? null
              : onFirstOptionTapped(_listPossibleCards.first.translation),
        ),
        FlatButton(
          child: Text(
            _listPossibleCards[1].translation,
            textScaleFactor: 2,
          ),
          textColor: _isSecondButtonDisabled ? Colors.red : Colors.black,
          onPressed: () => _isSecondButtonDisabled
              ? null
              : onSecondOptionTapped(_listPossibleCards[1].translation),
        ),
        FlatButton(
          child: Text(
            _listPossibleCards.last.translation,
            textScaleFactor: 2,
          ),
          textColor: _isThirdButtonDisabled ? Colors.red : Colors.black,
          onPressed: () => _isThirdButtonDisabled
              ? null
              : onThirdOptionTapped(_listPossibleCards.last.translation),
        ),
      ],
    );
  }

  onFirstOptionTapped(String translation) {
    if (!isRightAnswer(translation)) {
      setState(() {
        _isFirstButtonDisabled = true;
      });
    }
  }

  onSecondOptionTapped(String translation) {
    if (!isRightAnswer(translation)) {
      setState(() {
        _isSecondButtonDisabled = true;
      });
    }
  }

  onThirdOptionTapped(String translation) {
    if (!isRightAnswer(translation)) {
      setState(() {
        _isThirdButtonDisabled = true;
      });
    }
  }

  isRightAnswer(String translation) {
    if (translation == _trainingCardWidget.cardModel.translation) {
      initTrainingCards();
      return true;
    } else {
      return false;
    }
  }

  initTrainingCards() {
    setState(() {
      _isFirstButtonDisabled = false;
      _isSecondButtonDisabled = false;
      _isThirdButtonDisabled = false;
      _listPossibleCards = new List<CardModel>();
      for (var i = 0; i < 3; i++) {
        _listPossibleCards.add(widget
            ._listCardModel[_random.nextInt(widget._listCardModel.length)]);
      }
      _trainingCardWidget = new TrainingCardWidget(
          cardModel:
              _listPossibleCards[_random.nextInt(_listPossibleCards.length)]);
    });
  }
}
