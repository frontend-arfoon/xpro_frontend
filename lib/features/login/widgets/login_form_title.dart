import 'package:exact_pro/utils/utils.dart';
import 'package:flutter_utils/flutter_utils.dart';

class LoginFormTitle extends StatelessWidget {
  const LoginFormTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgIcon(SvgIcons.exactPro, width: 150, height: 30),
        Spaces.mediumHeight,
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
