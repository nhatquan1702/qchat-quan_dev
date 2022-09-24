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
    // return SizedBox(
    //   height: 115,
    //   width: 115,
    //   child: Stack(
    //     fit: StackFit.expand,
    //     clipBehavior: Clip.none,
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           borderRadius: const BorderRadius.all(Radius.circular(115 / 2)),
    //           border: Border.all(
    //             color: Theme.of(context).cardColor,
    //             width: 4.0,
    //           ),
    //         ),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(115 / 2),
    //           child: Image.network(
    //               'https://res.cloudinary.com/dmfrvd4tl/image/upload/v1656947957/AI%20QMusic/01fdd3f9a49bc8b528fbf66b13393bf316ba8d97a9_laxhlx.jpg',
    //               fit: BoxFit.cover),
    //         ),
    //       ),
    //       Positioned(
    //         right: 0,
    //         bottom: 0,
    //         child: SizedBox(
    //           height: 32,
    //           width: 32,
    //           child: TextButton(
    //             style: TextButton.styleFrom(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(50),
    //                 side: const BorderSide(color: Colors.white),
    //               ),
    //               primary: Colors.white,
    //               backgroundColor: const Color(0xFFC4C4C4),
    //             ),
    //             onPressed: () {},
    //             child: const Icon(Icons.camera_alt, size: 16,),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
