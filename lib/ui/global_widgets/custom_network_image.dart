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
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constrains){
        return FittedBox(
          fit: widget.fit,
          child: SizedBox(
            width: constrains.maxWidth,
            height: constrains.maxHeight,
            child: FutureBuilder(
              future: ImageCacheManager.instance.getImageWithUrl(url: widget.url),
              builder: (BuildContext context, AsyncSnapshot<Image?> snapshot) {
                Widget? image;

                if (snapshot.hasData && snapshot.data != null) {
                  image = snapshot.data!;
                } else {
                  image = widget.placeholder;
                }

                return image;
              },
            ),
          ),
        );
      },
    );
  }
}
