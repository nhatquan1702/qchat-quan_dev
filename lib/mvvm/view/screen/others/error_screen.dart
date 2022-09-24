import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/mvvm/view/component/base_button.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String titleError;
  final String messageError;
  final String codeError;

  const ErrorScreen(
      {super.key,
      required this.titleError,
      required this.messageError,
      required this.codeError});

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/404.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.14,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 25,
                    color: Colors.black.withOpacity(0.17),
                  ),
                ],
              ),
              child: BaseButtonFilled(
                radius: 10,
                title: ConstantStrings.reload,
                color: appColor.canvasColor.withOpacity(0.2),
                rootContext: context,
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
