import 'package:flutter/material.dart';
import 'package:starter/common/extensions/context_extension.dart';
import 'package:starter/common/widgets/app_error_widget.dart';
import 'package:starter/presentation/components/base/base_app_bar.dart';
import 'package:starter/presentation/components/base/base_scaffold.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  const ErrorPage({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(title: "Terjadi kesalahan", isBack: true),
      body: Center(
        child: AppErrorWidget(
          message: errorMessage,
          onTap: () => context.route.pop(),
        ),
      ),
    );
  }
}
