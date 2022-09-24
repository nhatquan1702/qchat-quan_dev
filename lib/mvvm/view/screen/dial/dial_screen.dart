import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/mvvm/view/screen/dial/round_button.dart';
import 'package:flutter/material.dart';
import 'dial_button.dart';

class DialScreen extends StatefulWidget {
  const DialScreen({Key? key}) : super(key: key);

  @override
  State<DialScreen> createState() => _DialScreenState();
}

class _DialScreenState extends State<DialScreen> {
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Scaffold(
      backgroundColor: appColor.cardColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: appColor.cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarGlow(
                  endRadius: 100,
                  glowColor: appColor.primaryColor,
                  duration: const Duration(milliseconds: 2000),
                  repeatPauseDuration: const Duration(milliseconds: 200),
                  child: Material(
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 110.0,
                      height: 110.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(55.0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Quang',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: appColor.canvasColor,),
                ),
                Text(
                  'Đang đổ chuông...',
                  style: TextStyle(
                    color: appColor.canvasColor.withOpacity(0.5),
                  ),
                ),
                const Spacer(),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    DialButton(
                      icon: Icons.mic_none_outlined,
                      text: ConstantStrings.mic,
                      press: () {},
                    ),
                    DialButton(
                      icon: Icons.volume_up_outlined,
                      text: ConstantStrings.volume,
                      press: () {},
                    ),
                    DialButton(
                      icon: Icons.video_call_outlined,
                      text: ConstantStrings.videoCall,
                      press: () {},
                    ),
                    DialButton(
                      icon: Icons.messenger_outline,
                      text: ConstantStrings.chat,
                      press: () {},
                    ),
                    DialButton(
                      icon: Icons.person_add_alt_outlined,
                      text: ConstantStrings.addContact,
                      press: () {},
                    ),
                    DialButton(
                      icon: Icons.voicemail_outlined,
                      text: ConstantStrings.voiceEmail,
                      press: () {},
                    ),
                  ],
                ),
                RoundedButton(
                  icon: Icons.call,
                  press: () {
                    Navigator.pop(context);
                  },
                  color: Colors.redAccent,
                  iconColor: appColor.canvasColor,
                  size: 72,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
