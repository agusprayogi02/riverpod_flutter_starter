import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class ImageWithLoader extends StatelessWidget {
  const ImageWithLoader({
    super.key,
    required this.imageUrl,
    this.height,
    this.size = 100,
    this.width,
    this.radius,
    this.child,
    this.boxShadow,
    this.borderRadius,
    this.isBG = false,
    this.isAsset = false,
    this.isFile = false,
    this.isLoading = false,
    this.fit,
    this.border,
    this.imageOpacity,
    this.color,
    this.padding,
    this.imageAlignment,
    this.colorFilter,
    this.gradientColor,
    this.onlyHeight = false,
  });

  final String imageUrl;
  final double? height;
  final double size;
  final double? width;
  final double? radius;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final bool isBG;
  final bool isLoading;
  final bool isAsset;
  final bool isFile;
  final BoxFit? fit;
  final BoxBorder? border;
  final Gradient? gradientColor;

  /// The opacity of the image, between 0.0 and 1.0.
  final double? imageOpacity;
  final Color? color;
  final EdgeInsets? padding;
  final AlignmentGeometry? imageAlignment;
  final ColorFilter? colorFilter;
  final bool onlyHeight;

  @override
  Widget build(BuildContext context) {
    if (isBG || imageUrl == '') {
      return Container(
        height: height ?? size,
        width: fit == BoxFit.fitHeight ? width ?? height : width ?? height ?? size,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (size / 10)),
          color: color ?? ColorTheme.grey,
          boxShadow: boxShadow,
        ),
        padding: padding,
        child: child,
      ).shimmer(enabled: isLoading);
    }
    if (isAsset || isFile) {
      if (imageUrl.endsWith('.svg')) {
        return SvgPicture.asset(
          imageUrl,
          height: fit == BoxFit.fitWidth ? height : height ?? size,
          width: fit == BoxFit.fitHeight ? width : width ?? height ?? size,
          colorFilter: colorFilter,
          fit: fit ?? BoxFit.cover,
          alignment: imageAlignment ?? Alignment.center,
        );
      }
      return Container(
        height: fit == BoxFit.fitWidth ? height : height ?? size,
        width: fit == BoxFit.fitHeight ? width : width ?? height ?? size,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (size / 10)),
          image: DecorationImage(
            image: (isFile ? FileImage(File(imageUrl)) : AssetImage(imageUrl)) as ImageProvider,
            colorFilter: colorFilter,
            fit: fit ?? BoxFit.cover,
            opacity: imageOpacity ?? 1,
            alignment: imageAlignment ?? Alignment.center,
          ),
          boxShadow: boxShadow,
          border: border,
          color: color,
          gradient: gradientColor,
        ),
        padding: padding,
        child: child,
      ).shimmer(enabled: isLoading);
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: fit == BoxFit.fitHeight ? null : width ?? height ?? size,
      height: fit == BoxFit.fitHeight ? height ?? size : null,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (size / 10)),
          boxShadow: boxShadow,
          border: border,
          color: color ?? ColorTheme.grey,
        ),
      ).shimmer(),
      imageBuilder: onlyHeight
          ? (context, imageProvider) => InstaImageViewer(
                child: ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (size / 10)),
                  child: Image(image: imageProvider),
                ),
              )
          : (context, imageProvider) => Container(
                height: height ?? size,
                width: fit == BoxFit.fitHeight ? width : width ?? height ?? size,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (size / 10)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.cover,
                    opacity: imageOpacity ?? 1,
                    colorFilter: colorFilter,
                    alignment: imageAlignment ?? Alignment.center,
                  ),
                  boxShadow: boxShadow,
                  border: border,
                  color: color,
                ),
                padding: padding,
                child: child,
              ),
      errorWidget: (context, url, error) => Container(
        height: height ?? size,
        width: fit == BoxFit.fitHeight ? width ?? height : width ?? height ?? size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/no_image.png"),
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (size / 10)),
          color: color ?? ColorTheme.grey,
          boxShadow: boxShadow,
        ),
        padding: padding,
        child: child,
      ),
    ).shimmer(enabled: isLoading);
  }
}
