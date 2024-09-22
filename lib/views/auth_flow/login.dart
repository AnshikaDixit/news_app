import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/constants/app_strings.dart';
import 'package:news_app/services/auth_service.dart';
import 'package:news_app/utils/app_text_style.dart';
import 'package:news_app/utils/custom_button.dart';
import 'package:news_app/views/dashboard/dashboard.dart';
import 'package:news_app/widgets/spacing.dart';
import 'package:news_app/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

void login(BuildContext context) async {
  setState(() {
    isLoading = true;
    errorMessage = null;
  });

  final authService = Provider.of<AuthService>(context, listen: false);
  try {
    await authService.signIn(emailController.text, passwordController.text);
    print("User signed in, navigating to dashboard...");
    Navigator.pushReplacementNamed(context, DashboardScreen.route);
  } catch (error) {
    setState(() {
      errorMessage = error.toString();
    });
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}



  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kcWhiteColor,
      title: Text(AppStrings.appNameMyNews, style: AppTextStyles.coloredBold(kcPrimaryColor, FontWeight.w800, 24)),
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  250.ph,
                  if (errorMessage != null) Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                  TextFormFieldWidget(hintText: AppStrings.email, controller: emailController),
                  20.ph,
                  TextFormFieldWidget(hintText: AppStrings.password, controller: passwordController),
                  250.ph,
                  isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: CustomButton(
                            text: AppStrings.login,
                            onPressed: isLoading ? (){} : () => login(context),
                          ),
                        ),
                  15.ph,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.newHere,
                          style: AppTextStyles.regular.copyWith(color: kcBlueColor, fontSize: 16),
                        ),
                        TextSpan(
                          text: AppStrings.signUp,
                          style: AppTextStyles.regular.copyWith(color: kcPrimaryColor, fontSize: 16, fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pushNamed(context, 'signup_screen');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
}