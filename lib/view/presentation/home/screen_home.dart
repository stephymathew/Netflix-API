import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_api/controller/api/api.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/view/presentation/home/widget/background_card.dart';
import 'package:netflix_api/view/presentation/home/widget/number_title_card.dart';
import 'package:netflix_api/view/presentation/widgets/main_title_card.dart';


ValueNotifier<bool> scrollNotifier= ValueNotifier(true);
int randomIndex = 0;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
   fetchDatas() async {
    trendingNowListNotifeir.value = await Api().getTrendingMovies();
    topRatedListNotifeir.value = await Api().getTopRated();
    upComingListNotifeir.value = await Api().getUpComing();
    top10TvShowsInIndiaTodayListNotifeir.value =await Api().getTop10TvShowsInIndiaToday();
    final random = Random();
    randomIndex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas();
    return   Scaffold(
      body:ValueListenableBuilder(valueListenable:scrollNotifier , builder:(BuildContext context,index,_){
        return NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          if(direction==ScrollDirection.reverse){
            scrollNotifier.value=false;
          }
          else if(direction==ScrollDirection.forward){
            scrollNotifier.value=true;
          }
          return true;
        },
        child: Stack(
          children: [
            ListView(
              children:   [
                 FutureBuilder(
                          future: Api().getTrendingMovies(),
                          builder: (context, snapshot) => snapshot.hasData
                              ? BackGroundCard(
                                  image: snapshot.data![randomIndex].posterPath)
                              : const SizedBox(
                                  height: 700,
                                  width: double.infinity,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                        ),
                
                MainTitleCard(title: ' Released in the past year', listNotifier: trendingNowListNotifeir,),
                kheight,
                MainTitleCard(title: ' Trending Now', listNotifier: topRatedListNotifeir,),
                kheight,
                NumberTitleCard(),
                kheight,
                MainTitleCard(title: ' Tense Dramas', listNotifier: upComingListNotifeir,),
                kheight,
                MainTitleCard(title: ' South Indian Cenimas', listNotifier: topRatedListNotifeir,),
                kheight
                
              ],
            ),
            scrollNotifier.value==true?
            AnimatedContainer(
              duration: const Duration(microseconds: 1000),
              width: double.infinity,
              height: 90,
              color: Colors.black.withOpacity(0.5),
              child: Column(
              children: [
              
                Row(
                  children: [
                    Image.network('https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                    width: 60,height: 60,),
                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                    ),
                                    kwidth,
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    ),
                                    kwidth
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('TV Shows',style: kHometitleText,),
                    Text('Movies',style: kHometitleText,),
                    Text('Categories',style: kHometitleText,)
                  ],
                )
              ],
              ),
            ):kheight
          ],
        ),
      );
      })
    );
  }
}
  






