import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';

import 'custom_button_widget.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key, required this.image});
  final String? image;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage((imagePath + image!))),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  iconSize: 30,
                  textSize: 18,
                ),
                _PlayButton(),
                CustomButtonWidget(
                  icon: Icons.info,
                  title: 'info',
                  iconSize: 30,
                  textSize: 18,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kblackcolor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kblackcolor),
          ),
        ));
  }
}
