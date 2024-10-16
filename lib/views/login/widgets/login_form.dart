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
    required this.onForget,
    required this.onAskRegister,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool loading;
  final bool obSecure;

  final Function() onFormSubmit;
  final Function() onObscure;
  final Function() onForget;
  final Function() onAskRegister;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: Spaces.only(
          horizontal: Spaces.medium,
          vertical: Spaces.small,
          bottom: context.isDesktop ? Spaces.xlarge : Spaces.medium),
      borderRadius: Radiuses.mediumCircle,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const LoginFormTitle(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              height: 60,
              prefix: SvgIcon(SvgIcons.email),
              hintLabel: "Email".localize(context),
              hintText: "Enter Your Email".localize(context),
              controller: emailController,
              validator: (value) {
                var isValidEmail = MXPUtils.isValidEmail(value);
                if (value.isEmpty) {
                  return "Email is Required".localize(context);
                }

                if (!isValidEmail) {
                  return 'Please enter a valid email'.localize(context);
                }
                return null;
              },
            ),
            Spaces.smallHeight,
            AppTextField(
              height: 60,
              hintLabel: "Password".localize(context),
              prefix: SvgIcon(SvgIcons.password),
              controller: passwordController,
              obSecureText: obSecure,
              hintText: "Enter Your Password".localize(context),
              suffix: SvgIcon(SvgIcons.obscura, onTap: onObscure),
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return 'Password must be at least 6 characters'
                      .localize(context);
                }
                return null;
              },
            ),
          ],
        ),
        AppCard(
          onTap: onForget,
          alignment: AlignmentDirectional.topEnd,
          child: Text("Forget Password".localize(context),
              style: context.theme.primaryTextTheme.labelMedium),
        ),
        Spaces.smallHeight,
        AppCard(
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
        AppCard(
          onTap: onAskRegister,
          child: RichText(
            text: TextSpan(
              text: "Do not hav an account".localize(context),
              style: context.theme.disabledTextTheme.labelMedium,
              children: [
                const TextSpan(text: "  "),
                TextSpan(
                    text: "Ask to get registered".localize(context),
                    style: context.theme.primaryTextTheme.bodyMedium),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
