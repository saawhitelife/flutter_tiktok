import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../utils/constants.dart';
import '../utils/screen_utils.dart';

/// Text in the bottom left corner of the middle section
class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenAwareWidth(10.0, context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: screenAwareHeight(15.0, context),
                ),
                child: Text(
                  '@author',
                  style: kVideoDescriptionTextStyle.copyWith(
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: screenAwareHeight(5.0, context),
                ),
                child: Text('Title #tag1 #tag2',
                    style: kVideoDescriptionTextStyle),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: screenAwareHeight(20.0, context),
                ),
                child: Text('see translation'.toUpperCase(),
                    style: kVideoDescriptionTextStyle),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: screenAwareHeight(5.0, context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.music_note,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: screenAwareWidth(5.0, context),
                    ),
                    Container(
                      width:
                          screenAwareWidth(kTrackTitleContainerWidth, context),
                      height: screenAwareHeight(30.0, context),
                      child: Marquee(
                        text: 'Original sound - composition ',
                        style: kVideoDescriptionTextStyle,
                      ),
                    )
                    // Text(
                    //   'original sound',
                    //   style: kVideoDescriptionTextStyle,
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
