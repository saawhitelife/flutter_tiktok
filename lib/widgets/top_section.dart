import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/screen_utils.dart';

/// Top section of the main screen
class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenAwareHeight(200.0, context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Following*', style: kTopSectionTextStyle),
          SizedBox(
            width: screenAwareWidth(20, context),
          ),
          Text(
            'For you',
            style: kTopSectionTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
