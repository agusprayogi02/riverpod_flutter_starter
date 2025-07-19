import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

extension WidgetExtensionX on Widget {
  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(child: this);

  SliverPadding sliverPadding(EdgeInsets insets) =>
      SliverPadding(padding: insets, sliver: toSliverBox);

  SizedBox sized({double? w, double? h}) => SizedBox(width: w, height: h, child: this);

  Expanded expand({int flex = 1}) => Expanded(flex: flex, child: this);

  SingleChildScrollView scrollVertical() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: this,
      );

  SingleChildScrollView scrollHorizontal() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: this,
      );

  Center center() => Center(child: this);

  Padding pad(double pad) => Padding(padding: EdgeInsets.all(pad.r), child: this);

  /// Padding with horizontal padding
  Padding px(double pad) => Padding(
        padding: EdgeInsets.symmetric(horizontal: pad.r),
        child: this,
      );

  /// Padding with vertical padding
  Padding py(double pad) => Padding(
        padding: EdgeInsets.symmetric(vertical: pad.r),
        child: this,
      );
  Padding pOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left.r,
          top: top.r,
          right: right.r,
          bottom: bottom.r,
        ),
        child: this,
      );
  SizedBox wFull(BuildContext context, {Key? key}) =>
      SizedBox(width: context.width, key: key, child: this);

  Widget shimmer({bool enabled = true, bool isText = false}) => enabled
      ? Shimmer.fromColors(
          baseColor: ColorTheme.grey[400]!,
          highlightColor: ColorTheme.grey[200]!,
          child: isText
              ? Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.grey[200],
                    borderRadius: 8.rounded,
                  ),
                  child: this,
                )
              : this,
        )
      : this;
}
