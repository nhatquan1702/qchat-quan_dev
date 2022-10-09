import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/error/error_screen.dart';
import 'package:chat_app/view/component/loader/loading_screen.dart';
import 'package:chat_app/view/component/widget/button_in_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contact_view_model.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactsScreen({Key? key}) : super(key: key);

  void selectContact(
      WidgetRef ref, Contact selectedContact, BuildContext context) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = Theme.of(context);

    return Scaffold(
      backgroundColor: appColor.cardColor,
      appBar: AppBar(
        backgroundColor: appColor.cardColor,
        title: Text(
          ConstantStrings.contact,
          style: TextStyle(color: appColor.primaryColor),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: appColor.primaryColor,
          ),
        ),
        actions: _buildActionsAppBar(context),
      ),
      body: ref.watch(getContactsProvider).when(
            data: (contactList) => ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  final contact = contactList[index];
                  return InkWell(
                    onTap: () {
                      selectContact(ref, contact, context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          contact.displayName,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        //subtitle: Text(contact.phones.first.number.toString()),
                        leading: contact.photoOrThumbnail == null
                            ? CircleAvatar(
                                backgroundColor:
                                    appColor.canvasColor.withOpacity(0.6),
                                radius: 20,
                                child: Icon(
                                  Icons.person,
                                  color: appColor.cardColor,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    MemoryImage(contact.photoOrThumbnail!),
                                radius: 20,
                              ),
                      ),
                    ),
                  );
                }),
            error: (error, trace) => ErrorScreen(
              titleError: ConstantStrings.error,
              messageError: error.toString(),
              codeError: trace.toString(),
            ),
            loading: () => const LoadingScreen(),
          ),
    );
  }

  List<Widget> _buildActionsAppBar(BuildContext context) {
    return [
      CustomButtonInAppbar(
        context: context,
        icon: Icons.search,
        function: () {},
      ),
      const SizedBox(
        width: 16,
      ),
    ];
  }
}
