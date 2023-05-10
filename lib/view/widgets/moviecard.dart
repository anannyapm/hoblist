import 'package:assignment/models/moviemodel.dart';
import 'package:flutter/material.dart';

String dummyurl =
    'https://www.mockofun.com/wp-content/uploads/2019/10/movie-poster-credits-178.jpg';

class MovieCard extends StatelessWidget {
  final MovieModel movieobject;

  const MovieCard({super.key, required this.movieobject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
        
          LeftSection(
              upvotecount:
                  movieobject.upVoted == null ? 0 : movieobject.upVoted!.length),
                  SizedBox(width: 10,),
                  TitleImageWidget(movieUrl: movieobject.poster),
      
        ],
      ),
    );
  }
}

class LeftSection extends StatelessWidget {
  const LeftSection({
    super.key,
    required this.upvotecount,
  });

  final int upvotecount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Column(
        children: [
           Icon(Icons.arrow_drop_up,size: 50,),
        Text(upvotecount.toString(),style: TextStyle(fontSize: 20)),
        Icon(Icons.arrow_drop_down,size: 50,),
        ],
        
       ),
       Text("Votes"),

      ],
    );
  }
}

class TitleImageWidget extends StatelessWidget {
  const TitleImageWidget({
    super.key,
    required this.movieUrl,
  });

  final String? movieUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 100,
       height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(3, 2), // changes position of shadow
      ),
    ],
          color: Colors.grey,
          image: DecorationImage(
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.fill,
              
              image: NetworkImage(movieUrl ?? dummyurl))),
    );
  }
}
