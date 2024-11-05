
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../helpers/env_reader.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.borderRadius,
    this.link,
    this.width,
    this.height,
    this.fit,
  });
  final double? borderRadius;
  final String? link;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      child: link != null
          ? CachedNetworkImage(
              imageUrl: link!,
              width: width ?? 30,
              height: height ?? 30,
              fit: fit,
              errorWidget: (context, url, error) => CachedImage(
                link: EnvReader.defaultImage,
                width: width ?? 30,
                height: height ?? 30,
                fit: fit,
                borderRadius: borderRadius,
              ),
              errorListener: (value) {},
            )
          : Container(),
    );
  }
}
