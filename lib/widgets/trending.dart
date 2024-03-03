import 'package:flutter/material.dart';
import 'package:tmbd/description.dart';
import 'package:tmbd/utils/text.dart';

class TrendingMovies extends StatelessWidget {

  final List trending;

  const TrendingMovies({ Key? key, required this.trending }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          modifiedText(text: 'Trending Movies', color: Colors.white, size: 26),

          SizedBox(height: 10),

          Container(
            height: 270,
            child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) =>Description(

                        name: trending[index]['title'], 

                        description: trending[index]['overview'], 

                        bannerurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'], 

                        posterurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'], 

                        vote: trending[index]['vote_average'].toString(), 

                        launch_date: trending[index]['release_date'])));
                  },

                  child: trending[index]['title']!=null?Container(
                    padding: EdgeInsets.all(5),
                    width: 140,
                    child: Column(  
                      children: [
                        Container(
                          height: 200,

                          decoration: BoxDecoration(  

                            borderRadius: BorderRadius.circular(20),

                            image: DecorationImage(  
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path']
                              ), fit: BoxFit.cover
                            )
                          ),     
                        ),

                        SizedBox(height: 10),

                        Container(
                          child: modifiedText(text: trending[index]['title'] != null 
                                ? trending[index]['title'] : 'Loading', 
                          color: Colors.white, 
                          size: 15,),
                        ),
                      ]
                    ),
                  ):Container()
                );
              }),
          )
        ],
      ),
      
    );
  }
}