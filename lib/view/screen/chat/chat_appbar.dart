import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/data/model/response/user_model.dart';
import 'package:chat_app/view/component/widget/button_in_appbar.dart';
import 'package:chat_app/view/screen/login/login_vew_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatDetailPageAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  final String uid;

  const ChatDetailPageAppBar({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = Theme.of(context);
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: appColor.cardColor,
      flexibleSpace: SafeArea(
        child: StreamBuilder<UserModel>(
          stream: ref.read(authViewModelProvider).getUserDataById(uid),
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: appColor.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data!.avatarUrl),
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          snapshot.data!.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        snapshot.data!.isOnline
                            ? Text(
                                "Online",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                ),
                              )
                            : Text(
                                "Offline",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .canvasColor
                                      .withOpacity(0.5),
                                  fontSize: 12,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        CustomButtonInAppbar(
          context: context,
          icon: Icons.call,
          function: () {
            Navigator.pushNamed(
              context,
              ConstantStringsRoute.routeToDialScreen,
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButtonInAppbar(
          context: context,
          icon: Icons.video_call,
          function: () {},
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
