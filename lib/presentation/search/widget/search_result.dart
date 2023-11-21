import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/search/widget/title.dart';


const imageUrl='https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg';
class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
          
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.01 / 1.5,
            children:List.generate(20, (index) {
              return MainCard();
            }),
            ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(image: NetworkImage(imageUrl),
        fit:BoxFit.cover ),
        borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}