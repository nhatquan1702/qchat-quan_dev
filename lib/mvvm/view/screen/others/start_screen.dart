import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/mvvm/view/component/base_button.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: appColor.cardColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Image.asset(
                'assets/images/logo_chat_app.png',
                height: 144,
                width: 144,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BaseButtonFilled(
                      radius: 10,
                      title: ConstantStrings.login,
                      color: appColor.primaryColor,
                      rootContext: context,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ConstantStringsRoute.routeToLoginScreen,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    BaseButtonFilled(
                      radius: 10,
                      title: ConstantStrings.register,
                      color: appColor.canvasColor.withOpacity(0.2),
                      rootContext: context,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          ConstantStringsRoute.routeToRegisterNumberPhoneScreen,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
