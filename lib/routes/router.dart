import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/mvvm/view/screen/auth/login/login_screen.dart';
import 'package:chat_app/mvvm/view/screen/auth/register/register_number_phone_screen.dart';
import 'package:chat_app/mvvm/view/screen/auth/register/verification.dart';
import 'package:chat_app/mvvm/view/screen/chat/chat_screen.dart';
import 'package:chat_app/mvvm/view/screen/dial/dial_screen.dart';
import 'package:chat_app/mvvm/view/screen/home/home_screen.dart';
import 'package:chat_app/mvvm/view/screen/home/widget/show_image.dart';
import 'package:chat_app/mvvm/view/screen/others/error_screen.dart';
import 'package:chat_app/mvvm/view/screen/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ConstantStringsRoute.routeToRegisterNumberPhoneScreen:
      return MaterialPageRoute(
        builder: (context) => const RegisterWithPhoneNumber(),
      );
    case ConstantStringsRoute.routeToLoginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case ConstantStringsRoute.routeToHomeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case ConstantStringsRoute.routeToDialScreen:
      return MaterialPageRoute(
        builder: (context) => const DialScreen(),
      );
    case ConstantStringsRoute.routeToChatDetailScreen:
      return MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      );
    case ConstantStringsRoute.routeToEditProfileScreen:
      return MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      );
    case ConstantStringsRoute.routeToVerificationScreen:
      //final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => const VerificationScreen(
          //verificationId: verificationId,
        ),
      );
    case ConstantStringsRoute.routeToShowImageScreen:
      return MaterialPageRoute(
        builder: (context) => const ShowImage(
          title: ConstantStrings.avatar,
          imgUrl:
              'https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg',
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(
            messageError: 'Một lỗi đã xảy ra',
            codeError: '000',
            titleError: 'Lỗi',
          ),
        ),
      );
    // case MobileChatScreen.routeName:
    //   final arguments = settings.arguments as Map<String, dynamic>;
    //   final name = arguments['name'];
    //   final uid = arguments['uid'];
    //   final isGroupChat = arguments['isGroupChat'];
    //   final profilePic = arguments['profilePic'];
    //   return MaterialPageRoute(
    //     builder: (context) => MobileChatScreen(
    //       name: name,
    //       uid: uid,
    //       isGroupChat: isGroupChat,
    //       profilePic: profilePic,
    //     ),
    //   );
    // case ConfirmStatusScreen.routeName:
    //   final file = settings.arguments as File;
    //   return MaterialPageRoute(
    //     builder: (context) => ConfirmStatusScreen(
    //       file: file,
    //     ),
    //   );
    // case StatusScreen.routeName:
    //   final status = settings.arguments as Status;
    //   return MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       status: status,
    //     ),
    //   );
  }
}
