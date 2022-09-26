import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            margin: const EdgeInsets.all(16.0),
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                    "https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/010189447d1cde0d9695f16cb5206643b26e595293_pz0s1t.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: 144.0,
          height: 144.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(144 / 2)),
            border: Border.all(
              color: Theme.of(context).cardColor,
              width: 5.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(144 / 2),
            child: Image.network(
                'https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg',
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
