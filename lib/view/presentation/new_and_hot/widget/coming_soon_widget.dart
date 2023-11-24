import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/model/movies/movie/movie.dart';
import 'package:netflix_api/view/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix_api/view/presentation/widgets/video_widget.dart';
import 'package:intl/intl.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({
    super.key, required this.movie,
  });
  final Movie movie;
  final DateFormat monthFormatter = DateFormat('MMM');
  final DateFormat dayFormatter = DateFormat('dd');
  final DateFormat dayFormatterDay = DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
         SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Text(
                monthFormatter.format(DateTime.parse(movie.releaseDate!)).toUpperCase(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
               Text(
                dayFormatter.format(DateTime.parse(movie.releaseDate!)),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: movie.posterPath,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width-170,
                    height: 50,
                    child: Text(
                      '${movie.title}',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: -4,
                        overflow: TextOverflow.fade
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.alarm,
                        title: 'Remind me',
                        iconSize: 15,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 15,
                        textSize: 12,
                      ),
                      kwidth
                    ],
                  )
                ],
              ),
              kheight,
              Text('Coming on ${dayFormatterDay.format(DateTime.parse(movie.releaseDate!))}'),
              kheight,
              Text(
                '${movie.title}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Text(
                '${movie.overview}',
                style: TextStyle(color: Colors.grey,overflow: TextOverflow.fade),
              )
            ],
          ),
        ),
      ],
    );
  }
}

const newandhottempimg =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/Aa9TLpNpBMyRkD8sPJ7ACKLjt0l.jpg';

