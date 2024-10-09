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
    var siz = MediaQuery.of(context).size;

    return Scaffold(
        body: SizedBox(
      width: siz.width,
      height: siz.height,
      child: Stack(
        children: [
          const Positioned(top: 0, child: LoginPageTop()),
          Positioned(
            left: 200,
            top: 100,
            child: Form(
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
          ),
          Positioned(
            right: 550,
            top: 300,
            child: SvgIcon(SvgIcons.officer, size: 100),
          ),
          Positioned(
            right: 200,
            bottom: 0,
            child: _buildLoginFormPlate(context),
          ),
        ],
      ),
    ));
  }

  Widget _buildLoginFormPlate(BuildContext context) {
    return XPCard(
      width: 500,
      height: 700,
      color: context.colors.primary,
      borderRadius: BorderRadius.circular(360).copyWith(
        bottomRight: const Radius.circular(0),
        bottomLeft: const Radius.circular(0),
      ),
    );
  }
}
