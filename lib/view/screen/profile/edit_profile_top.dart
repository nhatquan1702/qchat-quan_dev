import 'dart:io';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final File? imageAvatar;
  final File? imageCover;
  final VoidCallback? funPickAvatar;
  final VoidCallback? funPickCover;

  const ProfilePic(
      {super.key,
      this.imageAvatar,
      this.imageCover,
      this.funPickAvatar,
      this.funPickCover,
      });

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: InkWell(
            onTap: funPickCover,
            child: imageCover == null
                ? Container(
              margin: const EdgeInsets.all(16.0),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: appColor.canvasColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: const Icon(Icons.add_a_photo_outlined),
            )
                : Container(
              margin: const EdgeInsets.all(16.0),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                  // image: NetworkImage(
                  //     "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/010189447d1cde0d9695f16cb5206643b26e595293_pz0s1t.jpg"),
                  image: FileImage(imageCover!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ),
        Container(
          width: 144.0,
          height: 144.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(144 / 2)),
            border: Border.all(
              color: appColor.cardColor,
              width: 5.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(144 / 2),
            child: InkWell(
              onTap: funPickAvatar,
              child: (imageAvatar != null)
                  ? Image.file(
                      imageAvatar!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: appColor.canvasColor.withOpacity(0.1),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: appColor.canvasColor,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
