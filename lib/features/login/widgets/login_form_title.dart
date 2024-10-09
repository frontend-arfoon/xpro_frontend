import 'package:exact_pro/x_pro.dart';

class LoginFormTitle extends StatelessWidget {
  const LoginFormTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        XPCard(
          border: Border.all(width: 2, color: context.colors.primary),
          borderRadius: Radiuses.smallCircle,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                1.spacesW,
                SvgIcon(SvgIcons.exact),
                Spaces.miniWidth,
                Text("Exact",
                    style: context.theme.primaryDarkTextTheme.titleSmall),
                Spaces.miniWidth,
                XPCard(
                  padding: Spaces.tinyHorizontal,
                  color: context.colors.primary,
                  child: Text("Live",
                      style: context.theme.backgroundTextTheme.titleSmall),
                ),
              ]),
        ),
        Spaces.tinyHeight,
        Text(
          "Welcome back",
          style: context.theme.primaryTextTheme.displayLarge,
        ),
        Spaces.tinyHeight,
        const Text("Lets Get Your Sign In!"),
        Spaces.smallHeight,
      ],
    );
  }
}
