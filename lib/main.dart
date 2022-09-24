import 'package:chat_app/constant/theme.dart';
import 'package:chat_app/mvvm/view/screen/home/provider/home_tab_provider.dart';
import 'package:chat_app/mvvm/view/screen/home/provider/picker_img_provider.dart';
import 'package:chat_app/mvvm/view/screen/others/start_screen.dart';
import 'package:chat_app/routes/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectedHomeTapProvider()),
        ChangeNotifierProvider(create: (_) => PickerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const StartScreen(),
    );
  }
}

