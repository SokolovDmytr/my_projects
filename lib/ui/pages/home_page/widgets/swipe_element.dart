import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';


class SwipeElement extends StatefulWidget {
  final Widget child;
  final Widget background;

  const SwipeElement({
    required this.child,
    required this.background,
    Key? key,
  }) : super(key: key);

  @override
  _SwipeElementState createState() => _SwipeElementState();
}

class _SwipeElementState extends State<SwipeElement> with TickerProviderStateMixin {
  late AnimationController _closeController;
  late Animation<double> _closeAnimation;
  double _valueOfMove = 0.0;
  bool _isSwiped = false;
  bool _localPositionMoreThenWidgetHeight = false;
  bool _needAnimation = false;
  double? _width;
  double? _startPosition;
  double? _startPositionY;

  @override
  void initState() {
    super.initState();

    _closeController = AnimationController(
      vsync: this,
      duration: AppDuration.oneMinuteDuration,
      reverseDuration: AppDuration.swipeElementDuration,
    );
    _closeAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(_closeController);
  }

  @override
  void dispose() {
    _closeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    final double maxSwipeDistance = _width! / 4;
    final double partOfMaxSwipeDistance = 0.1 * maxSwipeDistance;
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constrains) {
        return AnimatedBuilder(
          animation: _closeAnimation,
          child: widget.child,
          builder: (BuildContext ctx, Widget? child) {
            return Listener(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  widget.background,
                  Positioned(
                    left: FlutterDictionary.instance.isRTL
                        ? _isSwiped
                        ? -maxSwipeDistance - _valueOfMove
                        : -_valueOfMove
                        : _isSwiped
                        ? maxSwipeDistance + _valueOfMove
                        : _valueOfMove,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: _needAnimation ? BorderRadius.circular(8.0) : BorderRadius.circular(0.0),
                      ),
                      width: constrains.minWidth,
                      child: child,
                    ),
                  ),
                ],
              ),
              onPointerDown: (position) {
                _startPosition = position.position.dx;
                _startPositionY = position.position.dy;
                _localPositionMoreThenWidgetHeight = false;
              },
              onPointerUp: (_) {
                if (_needAnimation) {
                  if (_valueOfMove < maxSwipeDistance - partOfMaxSwipeDistance) {
                    _closeController.reverse(from: 1.0);
                    _isSwiped = false;

                    _needAnimation = false;
                    _valueOfMove = 0.0;
                  } else {
                    _closeController.reverse(from: 1.0);
                    _valueOfMove = 0.0;
                    _isSwiped = true;
                  }
                }
              },
              onPointerMove: (position) {
                final double verticalDistance = position.position.dy - _startPositionY!;
                double distance = position.position.dx - _startPosition!;

                if (_localPositionMoreThenWidgetHeight == false) {
                  if (position.localPosition.dy > baseHeightOfIngredientElement || verticalDistance.abs() > distance.abs()) {
                    _localPositionMoreThenWidgetHeight = true;
                    _closeController.reverse(from: 1.0);
                    _isSwiped = false;

                    _needAnimation = false;
                    _valueOfMove = 0.0;
                  } else {
                    if (FlutterDictionary.instance.isRTL) {
                      distance = -distance;
                    }

                    if ((_isSwiped == false && distance > minSwipeDistance) || (_isSwiped && distance < 0 && maxSwipeDistance + distance > 0)) {
                      _needAnimation = true;
                      _closeController.forward();

                      if (distance < maxSwipeDistance) {
                        _valueOfMove = distance;
                      }
                    }
                  }
                }
              },
            );
          },
        );
      },
    );
  }
}