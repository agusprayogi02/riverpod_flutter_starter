import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter/common/constants.dart';
import 'package:starter/common/extensions/extensions.dart';
import 'package:starter/data/datasources/locals/developer_source.dart';
import 'package:starter/data/entities/developer_entity.dart';
import 'package:starter/presentation/components/base/base_scaffold.dart';
import 'package:starter/presentation/components/button/primary_button.dart';
import 'package:starter/presentation/pages/auth/login/login_page.dart';
import 'package:starter/presentation/pages/general/dev_mode/dev_mode_page.dart';
import 'package:starter/presentation/themes/theme.dart';
import 'package:starter/gen/assets.gen.dart';

part 'on_boarding_controller.dart';

class OnBoardingPage extends HookConsumerWidget {
  const OnBoardingPage({super.key});

  static const path = "/on-boarding";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = OnBoardingController(0);
    return BaseScaffold(
      body: Column(
        children: [
          const Spacer(),
          Assets.images.onBoardingAmico.image(
            height: 260.r,
          ),
          61.verticalSpacingRadius,
          Text(
            "Where Joy Brings Us Together",
            style: AppStyles.text20PxSemiBold.copyWith(
              color: ColorTheme.grey.shade900,
            ),
          ),
          16.verticalSpacingRadius,
          Text(
            'We believe that joy is a universal language that connects us all. Through cutting-edge technology and boundless creativity, we craft entertainment experiences designed to bring people closer, spark shared laughter, and create meaningful moments that last a lifetime.',
            style: AppStyles.text12Px.copyWith(
              color: ColorTheme.grey.shade600,
            ),
          ),
          const Spacer(),
          PrimaryButton(
            title: "Start Now",
            onTap: () {
              context.route.goNamed(LoginPage.path);
            },
          ),
          24.verticalSpacingRadius,
          FutureBuilder<DeveloperEntity?>(
            future: ref.read(developerSourceProvider).developer,
            builder: (context, ref) {
              if (ref.connectionState != ConnectionState.done) {
                if (ref.connectionState == ConnectionState.none) {
                  return Text(
                    'No Version',
                    style: AppStyles.text12Px.copyWith(
                      color: ColorTheme.grey.shade600,
                    ),
                  );
                }
                return Text(
                  'Loading...',
                  style: AppStyles.text12Px.copyWith(
                    color: ColorTheme.grey.shade600,
                  ),
                ).shimmer(isText: true);
              }
              var mode = ref.data!.mode.isNotEmpty && ref.data!.mode != Constants.prod
                  ? '(${ref.data!.mode})'
                  : 'Staging';
              return InkWell(
                onTap: () => c.next(context),
                child: Text(
                  'Version ${ref.data!.version} $mode',
                  style: AppStyles.text12Px.copyWith(
                    color: ColorTheme.grey.shade600,
                  ),
                ).pad(8),
              );
            },
          ),
          24.verticalSpacingRadius,
        ],
      ),
    );
  }
}
