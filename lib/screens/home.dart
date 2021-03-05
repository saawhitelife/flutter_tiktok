import 'package:flutter/material.dart';
import 'package:tik_tok_flutter/utils/screen_utils.dart';

import '../widgets/actions_toolbar.dart';
import '../widgets/bottom_section.dart';
import '../widgets/top_section.dart';
import '../widgets/video_description.dart';

/// TikTok home page
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget get middleSection => Expanded(
        child: Row(
          children: [
            VideoDescription(),
            ActionsToolbar(),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          TopSection(),
          middleSection,
          SizedBox(
            height: screenAwareHeight(10.0, context),
          ),
          BottomSection(),
        ],
      ),
    );
  }
}
