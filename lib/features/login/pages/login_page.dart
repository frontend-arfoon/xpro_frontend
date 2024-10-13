import 'package:exact_pro/features/login/widgets/login_page_side.dart';
import 'package:flutter_utils/flutter_utils.dart';

import 'package:exact_pro/x_pro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onLogin, this.onForget, this.onAskRegister});

  final Function(LoginData)? onLogin;
  final Function()? onForget;
  final Function()? onAskRegister;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class LoginData {
  final String email;
  final String password;

  LoginData({required this.email, required this.password});
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  String? error;

  bool onSecure = true;

  LoginData get _loginRecord => (LoginData(
        email: _emailController.text,
        password: _passwordController.text,
      ));

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
        children: [
          const Expanded(child: LoginPageSide()),
          Expanded(
            flex: context.isDesktop ? 1 : 2,
            child: AppCard(
              color: context.colors.primary,
              child: AppCard(
                borderRadius: context.isMobile
                    ? Radiuses.only(top: const Radius.circular(Spaces.medium))
                    : (context.ltr && context.isDesktop)
                        ? Radiuses.only(
                            left: const Radius.circular(Spaces.medium))
                        : Radiuses.only(
                            right: const Radius.circular(Spaces.medium)),
                color: context.colors.background,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (context.isDesktop) const LoginPageTop(),
                    Row(children: [
                      if (context.isDesktop) const Spacer(),
                      Expanded(
                        flex: 3,
                        child: Form(
                          key: _formKey,
                          child: LoginForm(
                            emailController: _emailController,
                            passwordController: _passwordController,
                            loading: loading,
                            onAskRegister: () {
                              widget.onAskRegister?.call();
                            },
                            onForget: () {
                              widget.onForget?.call();
                            },
                            onFormSubmit: () {
                              try {
                                var valid = _formKey.currentState!.validate();

                                if (!valid) {
                                  return;
                                }

                                setState(() {
                                  loading = true;
                                });

                                Future.delayed(const Duration(seconds: 3));
                                widget.onLogin?.call(_loginRecord);
                              } catch (e) {
                                setState(() {
                                  error = e.toString();
                                });
                              } finally {
                                setState(() {
                                  loading = false;
                                  error = null;
                                });
                              }
                            },
                            obSecure: onSecure,
                            onObscure: () {
                              setState(() {
                                onSecure = !onSecure;
                              });
                            },
                          ),
                        ),
                      ),
                      if (context.isDesktop) const Spacer(),
                    ]),
                    if (context.isDesktop) const SizedBox.shrink(),
                    if (error != null)
                      Text(error ?? "",
                          style: context.theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
