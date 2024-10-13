import 'package:exact_pro/utils/app_utils/svg_icons.dart';
import 'package:flutter_utils/flutter_utils.dart';

class LoginPageSide extends StatelessWidget {
  const LoginPageSide({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      height: double.infinity,
      width: double.infinity,
      color: context.colors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: context.isMobile
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (context.isMobile)
                AppCard(
                  padding: Spaces.smallHorizontal,
                  onPressed: () {
                    Locales.change(context, "ps");
                  },
                  onDoubleTap: () {
                    Locales.change(context, "en");
                  },
                  child: Row(children: [
                    SvgIcon(SvgIcons.global, color: context.colors.background),
                    SvgIcon(SvgIcons.arrow,
                        size: 14, color: context.colors.background),
                  ]),
                ),
              SvgIcon(SvgIcons.exactPro,
                  width: 200, height: 30, color: context.colors.background),
              if (context.isMobile) const SizedBox.shrink(),
              if (context.isMobile) const SizedBox.shrink(),
            ],
          ),
          if (context.isMobile) Spaces.tinyHeight,
          if (context.isDesktop)
            Text(
              "Accounting System",
              style: context.theme.backgroundTextTheme.displayLarge,
            ),
          if (context.isDesktop) Spaces.smallHeight,
          Image.asset(
            "assets/images/expro_login_image.png",
            scale: context.isDesktop ? 2 : 4,
          ),
          if (context.isDesktop) Spaces.mediumHeight,
          if (context.isDesktop)
            Text(
              "Take your financial management to new heights with precision, ",
              style: context.theme.backgroundTextTheme.bodySmall,
            ),
          if (context.isDesktop)
            Text(
              "speed, and trust in ExactPro.",
              style: context.theme.backgroundTextTheme.bodySmall,
            ),
        ],
      ),
    );
  }
}
