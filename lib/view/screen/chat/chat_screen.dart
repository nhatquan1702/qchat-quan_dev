import 'dart:async';
import 'dart:io';
import 'package:chat_app/constant/fakeData.dart';
import 'package:chat_app/constant/strings.dart';
import 'package:chat_app/view/component/enum/message_enum.dart';
import 'package:chat_app/view/component/provider/obscure_notifier.dart';
import 'package:chat_app/view/component/widget/picker_media.dart';
import 'package:chat_app/view/screen/chat/chat_appbar.dart';
import 'package:chat_app/view/screen/chat/chat_view_model.dart';
import 'package:chat_app/view/screen/chat/widget/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  final String uid;
  final bool isGroupChat;
  final String avatarUrl;
  final String name;

  const ChatDetailScreen({
    super.key,
    required this.uid,
    required this.isGroupChat,
    required this.avatarUrl,
    required this.name,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ChatDetailScreenState createState() {
    return _ChatDetailScreenState();
  }
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  FlutterSoundRecorder? _soundRecorder;

  void sendTextMessage(
    bool isShowSendButton,
    bool isRecorderInit,
    bool isRecording,
  ) async {
    if (isShowSendButton) {
      ref.read(chatViewModelProvider).sendTextMessage(
            context,
            textEditingController.text.toString().trim(),
            widget.uid,
            widget.isGroupChat,
          );
      setState(() {
        textEditingController.text = '';
      });
      Timer(const Duration(milliseconds: 200), () {
        _scrollToEnd();
      });
    } else {
      var tempDir = await getTemporaryDirectory();
      var path = '${tempDir.path}/flutter_sound.aac';
      if (!isRecorderInit) {
        return;
      }
      if (isRecording) {
        await _soundRecorder!.stopRecorder();
        sendFileMessage(File(path), MessageEnum.audio);
      } else {
        await _soundRecorder!.startRecorder(
          toFile: path,
        );
      }

      ref.read(obscureProvider).updateStatusRecording();
    }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatViewModelProvider).sendFileMessage(
          context,
          file,
          widget.uid,
          messageEnum,
          widget.isGroupChat,
        );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 200), () {
      _scrollToEnd();
    });
    KeyboardVisibilityController().onChange.listen((bool visible) async {
      if (visible) {
        Timer(const Duration(milliseconds: 200), () {
          _scrollToEnd();
        });
      }
    });
    _soundRecorder = FlutterSoundRecorder();
    //openAudio();
  }

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    if (!scrollController.hasClients) {
      return;
    }
    // var scrollPosition = scrollController.position;
    // if (scrollPosition.maxScrollExtent > scrollPosition.minScrollExtent) {
    //   scrollController.animateTo(
    //     scrollPosition.maxScrollExtent,
    //     duration: const Duration(milliseconds: 200),
    //     curve: Curves.easeOut,
    //   );
    // }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    final isShowSendButton = ref.watch(obscureProvider).changeSendButton;
    final isRecording = ref.watch(obscureProvider).isRecording;
    final isRecorderInit = ref.watch(obscureProvider).isRecorderInit;

    return Scaffold(
      appBar: ChatDetailPageAppBar(
        uid: widget.uid,
      ),
      body: Container(
        color: appColor.cardColor.withOpacity(0.8),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ChatList(
                    receiverUserId: widget.uid,
                    isGroupChat: widget.isGroupChat,
                    avatarUrl: widget.avatarUrl,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 16, bottom: 10),
                height: 80,
                width: double.infinity,
                color: appColor.cardColor,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showModal(context);
                        _scrollToEnd();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: appColor.canvasColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add,
                          color: appColor.cardColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            ref.read(obscureProvider).updateSendButton(true);
                          } else {
                            ref.read(obscureProvider).updateSendButton(false);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: ConstantStrings.enterMessage,
                          hintStyle: TextStyle(
                            color: appColor.canvasColor.withOpacity(0.3),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: isShowSendButton
                          ? () {
                              _scrollToEnd();
                              sendTextMessage(
                                isShowSendButton,
                                isRecorderInit,
                                isRecording,
                              );
                            }
                          : null,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: isShowSendButton
                              ? appColor.primaryColor
                              : appColor.canvasColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          isShowSendButton
                              ? Icons.send
                              : isRecording
                                  ? Icons.close
                                  : Icons.mic,
                          color: appColor.cardColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showModal(BuildContext context) {
    final appColor = Theme.of(context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: appColor.cardColor,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  height: 4,
                  width: 50,
                  color: appColor.cardColor.withOpacity(0.2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: FakeData.menuItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                      onTap: () {
                        switch (FakeData.menuItems[index].type) {
                          case MessageEnum.audio:
                            break;
                          case MessageEnum.video:
                            selectVideo();
                            break;
                          case MessageEnum.image:
                            selectImage();
                            break;
                          case MessageEnum.gif:
                            selectGIF();
                            break;
                          default:
                            break;
                        }
                      },
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: FakeData.menuItems[index].color.shade50,
                        ),
                        height: 50,
                        width: 50,
                        child: Icon(
                          FakeData.menuItems[index].icons,
                          size: 20,
                          color: FakeData.menuItems[index].color.shade400,
                        ),
                      ),
                      title: Text(FakeData.menuItems[index].text),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);
    if (video != null) {
      sendFileMessage(video, MessageEnum.video);
    }
  }

  void selectGIF() async {
    final gif = await pickGIF(context);
    if (gif != null) {
      // ignore: use_build_context_synchronously
      ref.read(chatViewModelProvider).sendGIFMessage(
        context,
        gif.url,
        widget.uid,
        widget.isGroupChat,
      );
    }
  }
}
