import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/data/datasources/locals/developer_source.dart';
import 'package:starter/data/entities/developer_entity.dart';
import 'package:starter/presentation/components/base/base_app_bar.dart';
import 'package:starter/presentation/components/base/base_scaffold.dart';
import 'package:starter/presentation/components/button/primary_button.dart';
import 'package:starter/presentation/pages/general/on_boarding/on_boarding_page.dart';
import 'package:starter/presentation/themes/theme.dart';

part 'setting_mode_controller.dart';

class SettingModePage extends HookConsumerWidget {
  const SettingModePage({super.key, required this.item});

  static String path = "/setting-mode";
  final DeveloperEntity item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = SettingModeController(0, item, context);
    return ReactiveFormBuilder(
      form: () => c.form,
      builder: (context, fGroup, child) {
        return BaseScaffold(
          appBar: BaseAppBar(
            title: 'Setting',
            isBack: true,
            onBack: () => context.route.goNamed(OnBoardingPage.path),
          ),
          bottomNavigationBar: Padding(
            padding: 24.allPer3V, // ignore: deprecated_member_use
            child: ReactiveFormConsumer(
              builder: (context, formGroup, child) => PrimaryButton(
                title: "Save",
                isEnable: formGroup.valid,
                onTap: () => c.submit(formGroup.rawValue, ref),
              ),
            ),
          ),
          body: Column(
            children: [
              Text(
                "Di gunakan untuk melakukan pengaktifan/deaktifan fitur yang ada dalam aplikasi",
                style: AppStyles.text12PxSemiBold.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
              // DropdownInput(
              //   title: "Channel",
              //   formControlName: 'channel',
              //   hint: "Pilih Channel",
              //   items: c.listChannels,
              // ),
            ],
          ),
        );
      },
    );
  }
}
