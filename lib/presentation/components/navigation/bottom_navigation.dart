import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/presentation/themes/theme.dart';

class BottomNavigation extends HookConsumerWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, Object?>> listItems = [
      {"icon": IconsaxPlusBold.home, "title": 'Explore'},
      {"icon": IconsaxPlusBold.message_text, "title": 'Updates'},
      {"icon": IconsaxPlusBold.ranking_1, "title": 'Awards'},
      {"icon": IconsaxPlusBold.dollar_circle, "title": 'Crowdfund'},
      // {
      //   "icon": IconsaxPlusBold.ticket,
      //   "title": 'Experience',
      // },
      {"icon": IconsaxPlusBold.shop_remove, "title": 'Shop'},
    ];
    // return DotBottomNav(
    //   hideOnScroll: false,
    //   indicatorColor: ColorTheme.primary,
    //   backgroundColor: ColorTheme.white,
    //   animationDuration: const Duration(milliseconds: 300),
    //   animationCurve: Curves.ease,
    //   selectedIndex: currentIndex,
    //   indicatorSize: 4,
    //   borderRadius: 0,
    //   margin: EdgeInsets.zero,
    //   onTap: onTap,
    //   items: [
    //     ItemBottomBar(
    //       index: 0,
    //       icon: IconsaxPlusBold.home,
    //       title: 'Home',
    //       current: currentIndex,
    //     ),
    //     ItemBottomBar(
    //       index: 1,
    //       icon: IconsaxPlusBold.ranking_1,
    //       title: 'Awards',
    //       current: currentIndex,
    //     ),
    //     ItemBottomBar(
    //       index: 2,
    //       current: currentIndex,
    //       icon: IconsaxPlusBold.dollar_circle,
    //       title: 'Crowdfund',
    //     ),
    //     ItemBottomBar(
    //       index: 3,
    //       current: currentIndex,
    //       icon: IconsaxPlusBold.ticket,
    //       title: 'Experience',
    //     ),
    //     ItemBottomBar(
    //       index: 4,
    //       current: currentIndex,
    //       icon: IconsaxPlusBold.shop_remove,
    //       title: 'Shop',
    //     ),
    //   ],
    // );
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showUnselectedLabels: true,
      selectedItemColor: ColorTheme.primary,
      unselectedItemColor: ColorTheme.grey.shade400,
      iconSize: 24.r,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: AppStyles.text11PxMedium,
      selectedLabelStyle: AppStyles.text11PxBold,
      backgroundColor: ColorTheme.white,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      items: listItems.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(
            item['icon'] as IconData,
            color: ColorTheme.grey.shade400,
          ).pOnly(bottom: 2),
          activeIcon: Icon(
            item['icon'] as IconData,
            color: ColorTheme.primary,
          ).pOnly(bottom: 2),
          label: item['title'] as String,
        );
      }).toList(),
    );
  }
}
