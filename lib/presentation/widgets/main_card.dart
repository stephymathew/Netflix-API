import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kradius,
          image: const DecorationImage(
            fit: BoxFit.cover,
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w220_and_h330_face/9PFonBhy4cQy7Jz20NpMygczOkv.jpg'))),
    );
  }
}
