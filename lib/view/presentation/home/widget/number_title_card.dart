import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/view/presentation/home/widget/number_card.dart';
import 'package:netflix_api/view/presentation/widgets/main_title.dart';

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
          child: ValueListenableBuilder(
              valueListenable: top10TvShowsInIndiaTodayListNotifeir,
              builder: (context, value, _) {
                return ListView.builder(
                    itemCount:
                        top10TvShowsInIndiaTodayListNotifeir.value.isNotEmpty
                            ? 10
                            : top10TvShowsInIndiaTodayListNotifeir.value.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = value[index];
                      return numberCard(index: index+1, movie: data);
                    });
              }),
        )
      ],
    );
  }
}
