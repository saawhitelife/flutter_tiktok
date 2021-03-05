import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/screen_utils.dart';

/// Actions at the bottom of the screen
class BottomSection extends StatelessWidget {
  final _customAddButtonGradient = LinearGradient(
      colors: [Colors.pink, Colors.blue],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.2, 0.8]);

  Widget _buildCustomAddButton(BuildContext context) => Stack(
        children: [
          Container(
            height: screenAwareHeight(kCustomAddButtonHeight, context),
            width: screenAwareWidth(kCustomAddButtonWidth, context),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: _customAddButtonGradient,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Container(
              height: screenAwareHeight(kCustomAddButtonHeight, context),
              width: screenAwareWidth(kCustomAddButtonWidth - 10.0, context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Icon(Icons.add),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Platform.isIOS ? 20 : 0),
      height: kBottomToolbarHeight,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.build,
              size: kBottomToolbarIconSize, color: kBottomToolbarIconColor),
          Icon(Icons.home,
              size: kBottomToolbarIconSize, color: kBottomToolbarIconColor),
          _buildCustomAddButton(context),
          Icon(Icons.search,
              size: kBottomToolbarIconSize, color: kBottomToolbarIconColor),
          Icon(Icons.zoom_out_map_sharp,
              size: kBottomToolbarIconSize, color: kBottomToolbarIconColor),
        ],
      ),
    );
  }
}
