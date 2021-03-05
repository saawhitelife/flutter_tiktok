import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/screen_utils.dart';

/// Like button in the action bar
class LikeAction extends StatefulWidget {
  @override
  _LikeActionState createState() => _LikeActionState();
}

class _LikeActionState extends State<LikeAction>
    with SingleTickerProviderStateMixin {
  AnimationController _iconController;
  Animation _iconAnimation;
  bool _didLike = false;
  Color _color = kActionToolbarIconColor;

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _didLike = true;
          setState(() {
            _color = Colors.pink;
          });
        }
      });
    _iconAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.0, end: 1.5).chain(
            CurveTween(curve: Curves.elasticOut),
          ),
          weight: 80.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.5, end: 1.0).chain(
            CurveTween(curve: Curves.linear),
          ),
          weight: 20.0,
        ),
      ],
    ).animate(_iconController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (!_didLike) {
                _iconController.reset();
                _iconController.forward();
              } else {
                setState(() {
                  _didLike = false;
                  _color = kActionToolbarIconColor;
                });
              }
            },
            child: ScaleTransition(
              scale: _iconAnimation,
              child: Icon(
                Icons.favorite,
                size: screenAwareHeight(kActionToolbarIconSize, context),
                color: _color,
              ),
            ),
          ),
          Text('3.4m', style: kActionToolbarTextStyle)
        ],
      ),
    );
  }
}
