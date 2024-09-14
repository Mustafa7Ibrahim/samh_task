import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:samh_task/core/localization/app_locale.dart';
import 'package:samh_task/core/localization/manage_locale_provider.dart';
import 'package:samh_task/core/resource/resource.dart';

class LogoWidget extends HookConsumerWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.04,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: () {
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                size.width * 0.4, // Control horizontal position
                size.height * 0.1, // Control vertical position
                size.width * 0.4,
                size.height * 0.1,
              ),
              items: [
                for (var locale in AppLocale.values)
                  PopupMenuItem<String>(
                    value: locale.code,
                    child: Text('${locale.flag} ${locale.name}'),
                  ),
              ],
            ).then((value) {
              if (value != null) {
                // Handle language selection
                if (value == AppLocale.arabic.code) {
                  ref
                      .read(manageAppLocaleProvider.notifier)
                      .toggleLanguage(true);
                } else {
                  ref
                      .read(manageAppLocaleProvider.notifier)
                      .toggleLanguage(false);
                }
              }
            });
          },
          child: Container(
            height: size.height * 0.1,
            alignment: Alignment.topCenter,
            child: Center(
              child: SvgPicture.asset(R.ASSETS_ICON_SVG, width: 150),
            ),
          ),
        ),
      ),
    );
  }
}
