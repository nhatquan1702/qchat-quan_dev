import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/constant/theme.dart';
import 'package:chat_app/route/route.dart';
import 'package:chat_app/view/component/error/error_screen.dart';
import 'package:chat_app/view/component/loader/loading_screen.dart';
import 'package:chat_app/view/screen/home/home_screen.dart';
import 'package:chat_app/view/screen/login/login_vew_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'view/screen/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const WelcomeScreen();
              } else {
                return const HomeScreen();
              }
            },
            error: (error, trace) {
              return ErrorScreen(
                titleError: ConstantStrings.error,
                messageError: error.toString(),
                codeError: trace.toString(),
              );
            },
            loading: () => const LoadingScreen(),
          ),
    );
  }
}
