import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/sing_in_controller.dart';
import 'package:task_manager/ui/screens/forgot_password_email_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_ber_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/background_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:task_manager/ui/widgets/centerted_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snackber_message.dart';

class SignInScreen extends StatefulWidget {
  static const String name = '/sign_in_screen';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BackgroundScreen(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 82),
                Text(
                  'Get Started With',
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                _buildSignInForm(),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: _onTabForgetPasswordButton,
                  child: const Text(
                    'Forget Password',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                _buildSignUpSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passwordTEController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'Enter your password';
                }
                return null;
              }),
          const SizedBox(height: 24),
          GetBuilder<SignInController>(
            builder: (controller) {
              return Visibility(
                visible: !controller.inProgress,
                replacement: const CenterCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: _onTabNextButton,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            wordSpacing: 4),
        text: "Don't have Account?",
        children: [
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(color: AppColor.themeColor),
            recognizer: TapGestureRecognizer()..onTap = _onTapSignUp,
            // Note: This sets up a gesture recognizer for the "Sign Up" text.
          ),
        ],
      ),
    );
  }

  void _onTabNextButton() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    final bool result = await signInController.signIn(
      _emailTEController.text.trim(),
      _passwordTEController.text,
    );
    if (result) {
      Get.offAllNamed(MainBottomNavBerScreen.name);
    } else {
      showSnackBerMessage(
        signInController.errorMessage!,
        true,
      );
    }
  }

  void _onTabForgetPasswordButton() {
    Get.to(() => const ForgotPasswordEmailScreen());

  }
  void _onTapSignUp() {
    Get.to(() => const SignUpScreen());
  }
}
