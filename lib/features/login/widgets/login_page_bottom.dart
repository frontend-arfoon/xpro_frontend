import 'package:exact_pro/x_pro.dart';

class LoginPageBottom extends StatelessWidget {
  const LoginPageBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        XPCard(
            onTap: () {},
            child: Text("Term Of US",
                style: context.theme.primaryTextTheme.bodyMedium)),
        Spaces.tinyWidth,
        XPCard(height: 15, width: 1, color: context.colors.disabledLight),
        Spaces.tinyWidth,
        XPCard(
            onTap: () {},
            child: Text("Privacy Policy",
                style: context.theme.primaryTextTheme.bodyMedium)),
      ]),
      Spaces.smallHeight,
    ]);
  }
}