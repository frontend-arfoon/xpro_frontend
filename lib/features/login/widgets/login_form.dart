import 'package:exact_pro/utils/app_utils/app_utils.dart';
import 'package:exact_pro/utils/new_utils/m_x_p_utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_utils/flutter_utils.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.loading,
    required this.onFormSubmit,
    required this.onObscure,
    required this.obSecure,
    this.error,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool loading;
  final bool obSecure;

  final Function() onFormSubmit;
  final Function() onObscure;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return XPCard(
      padding: Spaces.only(horizontal: Spaces.medium, vertical: Spaces.small),
      borderRadius: Radiuses.mediumCircle,
      maxWidth: 400,
      maxHeight: 500,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const LoginFormTitle(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: "Email",
              hintText: "Enter Your Email",
              controller: emailController,
              validator: (value) {
                var isValidEmail = MXPUtils.isValidEmail(value);
                if (value.isEmpty) {
                  return "Email is Required";
                }

                if (!isValidEmail) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            Spaces.smallHeight,
            AppTextField(
              label: "Password",
              controller: passwordController,
              obSecureText: obSecure,
              hintText: "Enter Your Password",
              suffix: SvgIcon(SvgIcons.obscura, onTap: onObscure),
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
          ],
        ),
        Spaces.smallHeight,
        if (error != null)
          XPCard(
            padding: Spaces.miniAll,
            child: Text(error!),
          ),
        XPCard(
          alignment: AlignmentDirectional.topEnd,
          child: Text("Forget Password?",
              style: context.theme.primaryTextTheme.labelMedium),
        ),
        Spaces.smallHeight,
        XPCard(
          onPressed: onFormSubmit,
          height: 40,
          width: double.infinity,
          color: context.colors.primary,
          borderRadius: Radiuses.mediumCircle,
          alignment: AlignmentDirectional.center,
          child: Text(
            loading ? "......" : "Get logged in",
            style: context.theme.backgroundTextTheme.bodyMedium,
          ),
        ),
        Spaces.smallHeight,
        RichText(
          text: TextSpan(
            text: "Don't hav an account",
            style: context.theme.disabledTextTheme.labelMedium,
            children: [
              const TextSpan(text: "  "),
              TextSpan(
                  text: "Ask to get registered!",
                  style: context.theme.primaryTextTheme.bodyMedium),
            ],
          ),
        )
      ]),
    );
  }
}
