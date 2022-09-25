import 'package:chat_app/data/model/response/chat_message.dart';
import 'package:chat_app/data/model/response/chat_user.dart';
import 'package:chat_app/data/model/response/send_menu_item.dart';
import 'package:flutter/material.dart';

class FakeData{
  static List<ChatUsers> chatUsers = [
    ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "Now"),
    ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "Yesterday"),
    ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "31 Mar"),
    ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "28 Mar"),
    ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "23 Mar"),
    ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "17 Mar"),
    ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "24 Feb"),
    ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "18 Feb"),
    ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "Now"),
    ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "Yesterday"),
    ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "31 Mar"),
    ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "28 Mar"),
    ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "23 Mar"),
    ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "17 Mar"),
    ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "24 Feb"),
    ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg", time: "18 Feb"),
  ];

  static List<ChatMessage> chatMessage = [
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I'm good what about you", type: MessageType.Sender),
    ChatMessage(message: "I'm fine, Working from home", type: MessageType.Receiver),
    ChatMessage(message: "Oh! Nice. Same here man", type: MessageType.Sender),
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I'm good what about you", type: MessageType.Sender),
    ChatMessage(message: "I'm fine, Working from home", type: MessageType.Receiver),
    ChatMessage(message: "Oh! Nice. Same here man", type: MessageType.Sender),
  ];

  static List<SendMenuItems> menuItems = [
    SendMenuItems(text: "Emoji", icons: Icons.emoji_emotions_outlined, color: Colors.purple),
    SendMenuItems(text: "GIF", icons: Icons.gif_box_outlined, color: Colors.green),
    SendMenuItems(text: "Photo", icons: Icons.image, color: Colors.amber),
    SendMenuItems(text: "Video", icons: Icons.video_collection, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
  ];
}
