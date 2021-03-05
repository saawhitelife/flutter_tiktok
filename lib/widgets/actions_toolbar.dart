import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/screen_utils.dart';
import '../widgets/like_action.dart';
import '../widgets/vinyl_disk.dart';

/// Actions toolbar in the right part of the middle section
class ActionsToolbar extends StatelessWidget {
  Widget _buildSocialAction(
          {String text, IconData icon, BuildContext context}) =>
      Container(
        child: Column(
          children: [
            Icon(
              icon,
              color: kActionToolbarIconColor,
              size: screenAwareHeight(kActionToolbarIconSize, context),
            ),
            Text(text, style: kActionToolbarTextStyle)
          ],
        ),
      );

  Widget _buildFollowButton(BuildContext context) => Container(
        height: screenAwareHeight(
            kActionToolbarFollowActionHeight + kFollowActionAddIconSize / 2,
            context),
        width: screenAwareWidth(kActionToolbarFollowActionWidth, context),
        child: Stack(
          children: [
            Positioned(
              left: screenAwareWidth(
                  kActionToolbarActionWidth / 2 - kActionToolbarAvatarWidth / 2,
                  context),
              child: Container(
                padding: EdgeInsets.all(1.0),
                width: screenAwareWidth(kActionToolbarAvatarWidth, context),
                height: screenAwareHeight(kActionToolbarAvatarHeight, context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(image: imageProvider),
                    ),
                  ),
                  fit: BoxFit.cover,
                  imageUrl: kTestAvatarUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              left: screenAwareWidth(
                  kActionToolbarActionWidth / 2 - kFollowActionAddIconSize / 2,
                  context),
              bottom: 0.0,
              child: Container(
                width: screenAwareWidth(kFollowActionAddIconSize, context),
                height: screenAwareHeight(kFollowActionAddIconSize, context),
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Icon(Icons.add,
                    size: screenAwareHeight(20.0, context),
                    color: Colors.white),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: screenAwareWidth(10.0, context),
      ),
      width: screenAwareWidth(kActionToolbarWidth, context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              right: screenAwareWidth(
                  (kVinylDiskWidth - kActionToolbarActionWidth) / 2, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildFollowButton(context),
                SizedBox(
                  height: screenAwareHeight(20.0, context),
                ),
                LikeAction(),
                SizedBox(
                  height: screenAwareHeight(20.0, context),
                ),
                _buildSocialAction(
                    text: '18.8k', icon: Icons.chat, context: context),
                SizedBox(
                  height: screenAwareHeight(20.0, context),
                ),
                _buildSocialAction(
                    text: '117.5k', icon: Icons.share, context: context),
                SizedBox(
                  height: screenAwareHeight(20.0, context),
                ),
              ],
            ),
          ),
          VinylDisk()
        ],
      ),
    );
  }
}
