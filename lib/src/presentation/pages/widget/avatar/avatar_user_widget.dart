import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../core/export.dart';

class AvatarUserWidget extends StatelessWidget {
  final String uri;
  final double radius;
  final ImageProvider? imageAssets;
  final EdgeInsetsGeometry? margin;

  const AvatarUserWidget({
    Key? key,
    this.uri = '',
    this.imageAssets,
    this.radius = 60,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = radius * 2;
    return Container(
      width: size,
      height: size,
      margin: margin,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 1.0,
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ClipOval(
          child: kIsWeb
              ? Image.network(
                  uri,
                  filterQuality: FilterQuality.high,
                )
              : CachedNetworkImage(
                  imageUrl: uri,
                  filterQuality: FilterQuality.high,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    period: const Duration(milliseconds: 700),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => Image(
                    image: const AssetImage(avatarPerson),
                    width: size,
                    height: size,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
        ),
      ),
    );
  }
}
