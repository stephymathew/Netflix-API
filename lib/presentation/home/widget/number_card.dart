import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';

class numberCard extends StatelessWidget {
  const numberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                
                  borderRadius: kradius,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w220_and_h330_face/keGfSvCmYj7CvdRx36OdVrAEibE.jpg'))),
            ),
          ],
        ),
        Positioned(
          left: 1,
          top: 50,
          
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kwhite,
            child: Text('$index',style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 140,
              color: kblackcolor,
              fontWeight: FontWeight.bold
            ),),
          ),
        )
      ],
    );
  }
}