import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/error/error_screen.dart';
import 'package:chat_app/view/screen/chat/chat_screen.dart';
import 'package:chat_app/view/screen/dial/dial_screen.dart';
import 'package:chat_app/view/screen/home/home_screen.dart';
import 'package:chat_app/view/screen/home/widget/show_image.dart';
import 'package:chat_app/view/screen/login/login_screen.dart';
import 'package:chat_app/view/screen/login/register/register_number_phone_screen.dart';
import 'package:chat_app/view/screen/login/register/user_information_screen.dart';
import 'package:chat_app/view/screen/profile/edit_profile_screen.dart';
import 'package:chat_app/view/screen/select_contact/select_contact_screen.dart';
import 'package:flutter/material.dart';

import '../view/screen/login/register/verification_screen.dart';

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
      final arguments = settings.arguments as Map<String, dynamic>;
      final uid = arguments['uid'];
      final isGroupChat = arguments['isGroupChat'];
      final avatarUrl = arguments['avatarUrl'];
      final name = arguments['name'];
      return MaterialPageRoute(
        builder: (context) => ChatDetailScreen(
          uid: uid,
          isGroupChat: isGroupChat,
          avatarUrl: avatarUrl,
          name: name,
        ),
      );
    case ConstantStringsRoute.routeToEditProfileScreen:
      return MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      );
    case ConstantStringsRoute.routeToVerificationScreen:
      final arguments = settings.arguments as Map<String, dynamic>;
      final phoneNumber = arguments['phoneNumber'];
      final verificationId = arguments['verificationId'];
      final resendToken = arguments['resendToken'];
      return MaterialPageRoute(
        builder: (context) => VerificationScreen(
          verificationId: verificationId.toString(),
          phoneNumber: phoneNumber.toString(),
          resendToken: resendToken.toString(),
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
    case ConstantStringsRoute.routeToShowSelectContactScreen:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
      );
    case ConstantStringsRoute.routeToShowUserInformationScreen:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
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
