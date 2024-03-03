import 'package:flutter/material.dart';
import 'package:tmbd/description.dart';
import 'package:tmbd/utils/text.dart';

class TopRatedMovies extends StatelessWidget {

  final List topratedmovies;

  const TopRatedMovies({ Key? key, required this.topratedmovies }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          modifiedText(text: 'Top Rated Movies', color: Colors.white, size: 26),

          SizedBox(height: 10),

          Container(
            height: 270,
            child: ListView.builder(
              itemCount: topratedmovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) =>Description(

                        name: topratedmovies[index]['title'], 

                        description: topratedmovies[index]['overview'], 

                        bannerurl: 'https://image.tmdb.org/t/p/w500' + topratedmovies[index]['backdrop_path'], 

                        posterurl: 'https://image.tmdb.org/t/p/w500' + topratedmovies[index]['poster_path'], 

                        vote: topratedmovies[index]['vote_average'].toString(), 

                        launch_date: topratedmovies[index]['release_date'])));
                  },

                  child: topratedmovies[index]['title']!=null?Container(
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
                                'https://image.tmdb.org/t/p/w500' + topratedmovies[index]['poster_path']
                              ), fit: BoxFit.cover
                            )
                          ),     
                        ),

                        SizedBox(height: 10),
                         
                        Container(
                          child: modifiedText(text: topratedmovies[index]['title'] != null 
                                ? topratedmovies[index]['title'] : 'Loading', 
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