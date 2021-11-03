import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/services/cache_manager/image_cache_manager.dart';

class CustomNetworkImage extends StatefulWidget {
  final String? url;
  final Image placeholder;
  final BoxFit fit;
  final BoxFit errorFit;

  const CustomNetworkImage({
    required this.url,
    required this.placeholder,
    required this.fit,
    required this.errorFit,
    Key? key,
  }) : super(key: key);

  @override
  _CustomNetworkImageState createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: AppDuration.durationForImageAnimation,
      vsync: this,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Image? image = ImageCacheManager.instance.getImageWithUrl(url: widget.url);
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constrains) {
        if (image != null) {
          return SizedBox(
            width: constrains.maxWidth,
            height: constrains.maxHeight,
            child: FittedBox(
              fit: widget.fit,
              child: image,
            ),
          );
        } else {
          return FutureBuilder(
            future: ImageCacheManager.instance.loadImage(url: widget.url!),
            builder: (BuildContext context, AsyncSnapshot<Image?> snapshot) {
              Widget? image;

              if (snapshot.hasData && snapshot.data != null) {
                image = snapshot.data!;
                _controller.forward(from: 0.0);
              }

              return AnimatedBuilder(
                animation: _controller,
                child: widget.placeholder,
                builder: (
                  BuildContext _,
                  Widget? child,
                ) {
                  return Stack(
                    children: [
                      Opacity(
                        opacity: _controller.value,
                        child: SizedBox(
                          width: constrains.maxWidth,
                          height: constrains.maxHeight,
                          child: FittedBox(
                            fit: image == null ? widget.errorFit : widget.fit,
                            child: image ?? child,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 1.0 - _controller.value,
                        child: SizedBox(
                          width: constrains.maxWidth,
                          height: constrains.maxHeight,
                          child: FittedBox(
                            fit: widget.errorFit,
                            child: child,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
