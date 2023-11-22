import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/widget/number_card.dart';
import 'package:netflix_api/presentation/widgets/main_title.dart';



class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 TV shows in India Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => numberCard(
                  index: index + 1,
                ),
              )),
        )
      ],
    );
  }
}
