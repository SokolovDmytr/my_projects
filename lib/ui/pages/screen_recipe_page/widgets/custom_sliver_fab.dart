import 'package:flutter/material.dart';

class CustomSliverFab extends StatefulWidget {
  final List<Widget> slivers;

  final Widget floatingWidget;

  final double expandedHeight;

  final double topScalingEdge;

  final FloatingPosition floatingPosition;

  CustomSliverFab({
    required this.slivers,
    required this.floatingWidget,
    this.floatingPosition = const FloatingPosition(right: 16.0),
    this.expandedHeight = 256.0,
    this.topScalingEdge = 96.0,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SliverFabState();
  }
}

class SliverFabState extends State<CustomSliverFab> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          controller: scrollController,
          slivers: widget.slivers,
        ),
        _buildFab(),
      ],
    );
  }

  Widget _buildFab() {
    final double defaultFabSize = 56.0;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double defaultTopMargin = widget.expandedHeight + paddingTop + (widget.floatingPosition.top ?? 0) - defaultFabSize / 2;

    final double scale0edge = widget.expandedHeight - kToolbarHeight;
    final double scale1edge = defaultTopMargin - widget.topScalingEdge;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (scrollController.hasClients) {
      final double offset = scrollController.offset;
      top -= offset > 0 ? offset : 0;
      if (offset < scale1edge) {
        scale = 1.0;
      } else if (offset > scale0edge) {
        scale = 0.0;
      } else {
        scale = (scale0edge - offset) / (scale0edge - scale1edge);
      }
    }

    return Positioned(
      top: top,
      right: widget.floatingPosition.right,
      left: widget.floatingPosition.left,
      child: Transform(
        transform: Matrix4.identity()..scale(scale, scale),
        alignment: Alignment.center,
        child: widget.floatingWidget,
      ),
    );
  }
}

class FloatingPosition {
  final double? top;
  final double? right;
  final double? left;

  const FloatingPosition({
    this.top,
    this.right,
    this.left,
  });
}
