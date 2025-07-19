import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/extensions/extensions.dart';
import '../../themes/theme.dart';

class BaseScaffold extends HookConsumerWidget {
  const BaseScaffold({
    super.key,
    this.body,
    this.bodyFull,
    this.appBar,
    this.padding,
    this.floatingActionButton,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.persistentFooterButtons,
    this.backgroundColor,
  });

  final Widget? body;
  final Widget? bodyFull;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final List<Widget>? persistentFooterButtons;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor ?? ColorTheme.scaffoldBackground,
      appBar: appBar,
      body: bodyFull ??
          SafeArea(
            child: Padding(padding: padding ?? 16.all, child: body),
          ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomSheet: bottomSheet,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: bottomNavigationBar,
      ),
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
