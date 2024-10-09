import 'dart:convert';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage(
    this.image, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
    this.fromSliverList,
    this.loadingSize,
    this.needCache = true,
    this.filterQuality,
    this.needResizeImage = false,
    this.loadingImageSize,
  });

  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;
  final bool? fromSliverList;
  final double? loadingSize;
  final bool? needCache;
  final FilterQuality? filterQuality;
  final bool needResizeImage;
  final double? loadingImageSize;

  bool isBase64(String str) {
    final RegExp base64RegExp = RegExp(
      r'^[A-Za-z0-9+/]+={0,2}$',
      multiLine: false,
    );
    return base64RegExp.hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    if (isBase64(image)) {
      return Base64ImageWidget(
        image: image,
        filterQuality: filterQuality ?? FilterQuality.low,
        height: height ?? MediaQuery.of(context).size.height,
        width: width ?? MediaQuery.of(context).size.width,
        fit: fit ?? BoxFit.cover,
        needResizeImage: needResizeImage,
        loadingSize: loadingSize,
        loadingImageSize: loadingImageSize,
      );
    }

    return needCache!
        ? CachedNetworkImage(
            imageUrl: image,
            placeholder: placeholder ??
                (context, url) =>
                    fromSliverList != null && fromSliverList == true
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetIcons.appTransparentIconX4,
                                height: loadingImageSize ?? 12,
                                width: loadingImageSize ?? 12,
                                fit: BoxFit.contain,
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetIcons.appTransparentIconX4,
                                height: loadingImageSize ?? 12,
                                width: loadingImageSize ?? 12,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
            //placeholderFadeInDuration: Duration.zero,
            //fadeOutDuration: Duration.zero,
            // maxWidthDiskCache: 4000,
            // maxHeightDiskCache: 2500,
            memCacheHeight: needResizeImage ? height?.toInt() : null,
            memCacheWidth: needResizeImage ? width?.toInt() : null,
            useOldImageOnUrlChange: true,
            filterQuality: filterQuality ?? FilterQuality.low,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
            fadeInCurve: Curves.ease,
          )
        : Image.network(
            image,
            loadingBuilder: (context, url, _) =>
                fromSliverList != null && fromSliverList == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetIcons.appTransparentIconX4,
                            height: loadingImageSize ?? 12,
                            width: loadingImageSize ?? 12,
                            fit: BoxFit.contain,
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetIcons.appTransparentIconX4,
                            height: loadingImageSize ?? 12,
                            width: loadingImageSize ?? 12,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
            errorBuilder: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
          );
  }
}

class Base64ImageWidget extends StatelessWidget {
  const Base64ImageWidget({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit,
    this.fromSliverList,
    this.loadingSize,
    this.needCache = true,
    this.filterQuality,
    this.needResizeImage = false,
    this.loadingImageSize,
  });

  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool? fromSliverList;
  final double? loadingSize;
  final bool? needCache;
  final FilterQuality? filterQuality;
  final bool needResizeImage;
  final double? loadingImageSize;

  @override
  Widget build(BuildContext context) {
    final Uint8List bytes = base64Decode(image);

    return Image.memory(
      bytes,
      filterQuality: filterQuality ?? FilterQuality.high,
      errorBuilder: (context, url, error) => const Icon(Icons.error),
      height: height ?? MediaQuery.of(context).size.height,
      width: width ?? MediaQuery.of(context).size.width,
      fit: fit ?? BoxFit.cover,
      cacheHeight: needResizeImage ? height?.toInt() : null,
      cacheWidth: needResizeImage ? width?.toInt() : null,
    );
  }
}
