import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final List<Widget> _widgetList;

  GridWidget({List<Widget> widgetList}) :_widgetList = widgetList;


  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children : _widgetList
    );
  }
}