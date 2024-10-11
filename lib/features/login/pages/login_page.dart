import 'package:exact_pro/features/dashboard/views/dashboard_screen.dart';
import 'package:exact_pro/utils/new_utils/m_x_p_utils.dart';
import 'package:exact_pro/x_pro.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_utils/flutter_utils.dart';

// All Test Pages
// 1) TestLoginPage()
// 1.1) LoginPage(onLogin(username, password){})

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  bool onSecure = true;

  bool isMobile = false;

  String? error;

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
          if (!isMobile) const Positioned(top: 0, child: LoginPageTop()),
          Positioned(
            left: size.width <= 500 ? 40 : 200,
            top: size.width <= 500 ? 250 : 100,
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

                    setState(() {
                      loading = true;
                    });

                    Future.delayed(const Duration(seconds: 3));
                    MXPUtils.goTo(context, const DashboardScreen());
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
            right: size.width <= 500 ? 0 : 200,
            bottom: size.width <= 500 ? null : 0,
            top: size.width <= 500 ? 0 : null,
            child: _buildLoginFormPlate(context, size),
          ),
          Positioned(
            right: size.width <= 500 ? 150 : 500,
            top: size.width <= 500 ? 80 : 300,
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
      width: size.width <= 500 ? 500 : 400,
      height: size.width <= 500 ? 270 : 700,
      color: context.colors.primary,
      borderRadius: size.width <= 500
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
