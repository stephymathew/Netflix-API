import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';

class videoListItem extends StatelessWidget {
  final int index;
  const videoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
          
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,
            vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 25,
                  child: IconButton(onPressed: (){}, 
                  icon:Icon(Icons.volume_off,color: kwhite,) ),
                ),

                // right side

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10 ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          "https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
                        ),
                      ),
                    ),
                        videoActionsWidget(
                        icon: Icons.emoji_emotions,title: 'LOL'),
                        videoActionsWidget(
                        icon: Icons.add, title: 'My List'),
                        videoActionsWidget(
                        icon: Icons.share, title: 'Share'),
                        videoActionsWidget(
                        icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class videoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const videoActionsWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
    
        children: [
          Icon(icon,color: Colors.white,shadows: [
            BoxShadow(
              color: Colors.grey[800]!,
              blurRadius: 10,
              offset: Offset(3, 3),
              )
          ],),
          Text(title,style: const TextStyle(
            color: kwhite,
            fontSize: 15
          ),),
        ],
      ),
    );
  }
}