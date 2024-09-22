import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/constants/app_routes.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/services/auth_service.dart';
import 'package:news_app/providers/auth_wrapper.dart';
import 'package:news_app/services/firebase_options.dart';
import 'package:news_app/utils/app_text_style.dart';
import 'package:news_app/views/auth_flow/sign_up.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider
  (
    providers: [
      ChangeNotifierProvider(create: (_) => NewsProvider()),
      Provider(create: (_) => AuthService()), 
    ],
    child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignupScreen.route,
      onGenerateRoute: Routes.generateRoute,
      title: 'News App',
      locale: const Locale('en', 'US'), 
       theme: ThemeData(
                primarySwatch: Colors.blue,
                brightness: Brightness.light,
                scaffoldBackgroundColor: kcWhiteColor,
                textTheme: AppTextStyles.lightTextTheme,
              ),
      home: const AuthWrapper(),
    );
  }
}
