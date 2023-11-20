import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
 ScreenDownloads({super.key});
  
  final _WidgetList= [
          const _SmartDownloads(),
          Section2(),
          Section3(),
          
         
        ];
  
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: 'Downloads',)),
      body:ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder:(ctx, index) => _WidgetList[index] , 
        separatorBuilder: (ctx, index) =>SizedBox(height: 25,) ,
         itemCount: _WidgetList.length)
    );
  }
}

class Section2 extends StatelessWidget {
   Section2({super.key});

  final List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg",
  ];


  @override
  Widget build(BuildContext context) {
       final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
       const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhite, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          'We will download a personalised selection of\nmovies and shows for you, So there\nalways something to watch on your\ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              downloadsImageWidget(
                  imageList: imageList[2],
                  margin: EdgeInsets.only(left: 140, bottom: 50,top: 40),
                  angle: 25,
                  size: Size(size.width * 0.4, size.width * 0.58)),
              downloadsImageWidget(
                imageList: imageList[1],
                margin: EdgeInsets.only(right: 140, bottom: 50,top: 30),
                angle: -25,
                size: Size(size.width * 0.4, size.width * 0.58),
              ),
              downloadsImageWidget(
                  imageList: imageList[0],
                  margin: EdgeInsets.only(bottom: 10,top: 30),
                  size: Size(size.width * 0.45, size.width * 0.65)),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
     SizedBox(
      width: double.infinity,
       child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: buttoncolorblue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
     ),
     kheight,
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: buttoncolorWhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See What you can download',
              style: TextStyle(
                  color: kblackcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.settings,
      color: kwhite,),
      Text('Smart Downloads')
    ],);
  }
}

class downloadsImageWidget extends StatelessWidget {
  const downloadsImageWidget({
    super.key,
    
    required this.imageList, 
     this.angle=0, required this.margin,
      required this.size,
       this.radius=10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    
    return Transform.rotate(
     angle: angle* pi /180 ,
      child: Container(
        margin: margin,
       width: size.width,
       height: size.height,
       
       decoration: BoxDecoration(
        
         borderRadius: BorderRadius.circular(radius), 
         image: DecorationImage(
          fit: BoxFit.cover,
          image:NetworkImage(imageList) )
       ),
        
      ),
    );
  }
}
