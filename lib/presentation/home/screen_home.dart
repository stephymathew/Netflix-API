import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/widget/background_card.dart';
import 'package:netflix_api/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix_api/presentation/home/widget/number_title_card.dart';
import 'package:netflix_api/presentation/widgets/app_bar_widget.dart';
import 'package:netflix_api/presentation/widgets/main_title_card.dart';


ValueNotifier<bool> scrollNotifier= ValueNotifier(true);
class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
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
              children:  const [
                BackGroundCard(),
                MainTitleCard(title: ' Released in the past year',),
                kheight,
                MainTitleCard(title: ' Trending Now',),
                kheight,
                NumberTitleCard(),
                kheight,
                MainTitleCard(title: ' Tense Dramas'),
                kheight,
                MainTitleCard(title: ' South Indian Cenimas'),
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
  






