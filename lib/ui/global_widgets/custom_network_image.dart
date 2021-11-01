import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/cache_manager/image_cache_manager.dart';

class CustomNetworkImage extends StatefulWidget {
  final String? url;
  final Image placeholder;
  final BoxFit fit;

  const CustomNetworkImage({
    required this.url,
    required this.placeholder,
    required this.fit,
    Key? key,
  }) : super(key: key);

  @override
  _CustomNetworkImageState createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ImageCacheManager.instance.getImageWithUrl(url: widget.url),
      builder: (BuildContext context, AsyncSnapshot<Image?> snapshot) {
        Widget image = widget.placeholder;

        if (snapshot.hasData && snapshot.data != null) {
          image = snapshot.data!;
        }

        return FittedBox(
          fit: widget.fit,
          child: image,
        );
      },
    );
  }
}
