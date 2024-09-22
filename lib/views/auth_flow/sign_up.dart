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

class SignupScreen extends StatefulWidget {
  static const String route = "signup_screen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;


  void signUp(BuildContext context) async {
  setState(() {
    isLoading = true;
    errorMessage = null;
  });

  final authService = Provider.of<AuthService>(context, listen: false);
  try {
    await authService.signUp(emailController.text, passwordController.text);
    Navigator.pushReplacementNamed(context, DashboardScreen.route); // Navigate here
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
        backgroundColor: kcWhiteColor,
        title: Text(AppStrings.appNameMyNews, style: AppTextStyles.coloredBold(kcPrimaryColor, FontWeight.w800, 24)),
      ),
      body: SingleChildScrollView(
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Form(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  150.ph,
                  if (errorMessage != null) Text(errorMessage!, style: TextStyle(color: Colors.red)),
                  TextFormFieldWidget(hintText: AppStrings.name,controller: nameController,),
                  20.ph,
                  TextFormFieldWidget(hintText: AppStrings.email, controller: emailController,),
                  20.ph,
                  TextFormFieldWidget(hintText: AppStrings.password, controller: passwordController,),
                  280.ph,
                  isLoading
                  ? CircularProgressIndicator() :
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: CustomButton(text: AppStrings.signUp,  onPressed: () => signUp(context),)),
                  15.ph,
                   RichText(
                      text: TextSpan(
                        children: [
                           TextSpan(
                            text: AppStrings.alreadyHaveAnAccount,
                            style: AppTextStyles.regular.copyWith(color: kcBlueColor, fontSize: 16)
                          ),
                          TextSpan(
                            text: AppStrings.login,
                             style: AppTextStyles.regular.copyWith(color: kcPrimaryColor, fontSize: 16, fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              // Navigate to login screen
                              Navigator.pushNamed(context, 'login_screen'); // Update with your login route
                            },
                          ),
                        ],
                      ),),
                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
