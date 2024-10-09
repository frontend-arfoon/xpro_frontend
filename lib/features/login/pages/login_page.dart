import 'package:exact_pro/x_pro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool onSecure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const LoginPageTop(),
        Form(
          key: _formKey,
          child: LoginForm(
            emailController: _emailController,
            passwordController: _passwordController,
            isLoading: isLoading,
            onFormSubmit: () {
              try {
                if (_formKey.currentState?.validate() ?? false) {}
              } catch (e) {
                //
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
        const LoginPageBottom(),
      ],
    ));
  }
}
