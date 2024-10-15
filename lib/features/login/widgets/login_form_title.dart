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
        Text("Sign in".localize(context),
            style: context.theme.primaryTextTheme.displayLarge),
        Text("Welcome back".localize(context),
            style: context.theme.textTheme.displayLarge),
        if (context.isDesktop) Spaces.tinyHeight,
        if (context.isDesktop) Text("Lets Get Your Sign In".localize(context)),
        Spaces.smallHeight,
      ],
    );
  }
}
