import 'package:flutter/material.dart';
import 'package:tp3/util/strings.dart';
import'package:tp3/app/hiragana/hiragana.dart';
import'package:tp3/app/model/cardModel.dart';
import 'package:tp3/app/gridWidget.dart';
import 'package:tp3/app/cardWidget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home> {
  final List<Widget> _widgetList = new List<Widget>();
  final List<CardWidget> _cardWidgetList = new List<CardWidget>();
  final List<CardModel> _listCardModel = new List<CardModel>();
  GridWidget _gridWidget;
  int _currentPageIndex =0;
  var _hiragana_dictionnary = Hiraganas;




  @override
  Widget build(BuildContext context) {
    var strings = Strings.of(context);

    _hiragana_dictionnary.forEach((symbol,translation) => _listCardModel.add(new CardModel(symbol: symbol, translation: translation)));
    _listCardModel.forEach((cardModel) =>_cardWidgetList.add(new CardWidget(cardModel: cardModel,)));
    _gridWidget = new GridWidget(widgetList: _cardWidgetList);
    _widgetList.add(_gridWidget);
    _widgetList.add(new CardWidget(cardModel: new CardModel(symbol: "T", translation: ""),));


    return Scaffold(
        appBar: AppBar(
          title: Text(strings.title),
        ),
        body :_widgetList[_currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text("Apprendre"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              title: Text("Entrainement"),
            )
          ],
        ),
    );
  }

   onTabTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

}
