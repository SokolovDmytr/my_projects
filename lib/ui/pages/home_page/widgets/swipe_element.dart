import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';

class SwipeElement extends StatefulWidget {
  final Widget child;
  final Widget background;
  bool _needAnimation = false;
  double _startPosition = 0.0;
  double _valueOfMove = 0.0;

  SwipeElement({
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
  double? width;

  @override
  void initState() {
    super.initState();

    _closeController = AnimationController(
      vsync: this,
      duration: AppDuration.oneMinuteDuration,
      reverseDuration: milliseconds500,
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
    width = MediaQuery.of(context).size.width;
    final double maxSwipeDistance = width! / 3;
    final double partOfMaxSwipeDistance = 0.02 * maxSwipeDistance;

    return AnimatedBuilder(
      animation: _closeAnimation,
      child: widget.background,
      builder: (BuildContext ctx, Widget? child) {
        return Listener(
          child: Stack(
            children: [
              child!,
              Positioned(
                left: FlutterDictionary.instance.isRTL ? -widget._valueOfMove : widget._valueOfMove,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: widget._valueOfMove < 8.0 ? BorderRadius.circular(0.0) : BorderRadius.circular(8.0),
                  ),
                  width: width,
                  child: widget.child,
                ),
              ),
            ],
          ),
          onPointerDown: (position) {
            widget._startPosition = position.position.dx;
          },
          onPointerUp: (_) {
            if (widget._needAnimation) {
              if (widget._valueOfMove < maxSwipeDistance - partOfMaxSwipeDistance) {
                _closeController.reverse();

                widget._needAnimation = false;
                widget._valueOfMove = _closeController.value;
              } else {
                widget._valueOfMove = maxSwipeDistance;
              }
            }
          },
          onPointerMove: (position) {
            double distance = position.position.dx - widget._startPosition;

            if (FlutterDictionary.instance.isRTL) {
              if (distance > 0.0) return;

              distance = -distance;
            }

            if (FlutterDictionary.instance.isRTL == false && distance < 0.0) {
              return;
            }

            if (distance > minSwipeDistance) {
              widget._needAnimation = true;
              _closeController.forward();

              if (distance < maxSwipeDistance) {
                widget._valueOfMove = distance;
              }
            }
          },
        );
      },
    );
  }
}