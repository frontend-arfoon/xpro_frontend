import 'package:flutter_utils/flutter_utils.dart';

import 'package:exact_pro/x_pro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onLogin});

  final Function(LoginData)? onLogin;

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
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          if (!context.isDesktop)
            const Positioned(top: 0, child: LoginPageTop()),
          Positioned(
            left: context.isMobile ? 40 : 200,
            top: context.isMobile ? 250 : 100,
            child: Form(
              key: _formKey,
              child: LoginForm(
                emailController: _emailController,
                passwordController: _passwordController,
                loading: loading,
                error: error,
                onFormSubmit: () {
                  try {
                    var valid = _formKey.currentState!.validate();

                    if (!valid) {
                      return;
                    }

                    if (error == null) {
                      setState(() {
                        error = "this is an error";
                      });
                    }

                    //! work on it
                    // if (error != null) {
                    //   setState(() {
                    //     error = "Error";
                    //   });
                    //   return;
                    // }

                    setState(() {
                      loading = true;
                    });

                    Future.delayed(const Duration(seconds: 3));
                    widget.onLogin?.call(_loginRecord);
                  } catch (e) {
                    error = e.toString();
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
          Positioned(
            right: context.isMobile ? 0 : 200,
            bottom: context.isMobile ? null : 0,
            top: context.isMobile ? 0 : null,
            child: _buildLoginFormPlate(context, size),
          ),
          Positioned(
            right: context.isMobile ? 150 : 500,
            top: context.isMobile ? 80 : 300,
            width: 200,
            height: 200,
            child: SvgPicture.asset("assets/svg/exact.svg"),
          ),
        ],
      ),
    ));
  }

  Widget _buildLoginFormPlate(BuildContext context, Size size) {
    return XPCard(
      width: context.isMobile ? 500 : 400,
      height: context.isMobile ? 270 : 700,
      color: context.colors.primary,
      borderRadius: context.isMobile
          ? BorderRadius.circular(360).copyWith(
              topRight: const Radius.circular(0),
              topLeft: const Radius.circular(0),
            )
          : BorderRadius.circular(360).copyWith(
              bottomRight: const Radius.circular(0),
              bottomLeft: const Radius.circular(0),
            ),
    );
  }
}
