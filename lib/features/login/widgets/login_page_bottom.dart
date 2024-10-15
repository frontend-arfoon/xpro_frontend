import 'package:flutter_utils/flutter_utils.dart';

class LoginPageBottom extends StatelessWidget {
  const LoginPageBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppCard(
            onTap: () {},
            child: Text("Term Of US",
                style: context.theme.primaryTextTheme.bodyMedium)),
        Spaces.tinyHeight,
        AppCard(height: 15, width: 1, color: context.colors.disabledLight),
        Spaces.tinyWidth,
        AppCard(
            onTap: () {},
            child: Text("Privacy Policy",
                style: context.theme.primaryTextTheme.bodyMedium)),
      ]),
      Spaces.smallHeight,
    ]);
  }
}
