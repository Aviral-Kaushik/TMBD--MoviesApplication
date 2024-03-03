// @dart2.9
import 'package:flutter/material.dart';
import 'package:tmbd/utils/text.dart';
import 'package:tmbd/widgets/toprated.dart';
import 'package:tmbd/widgets/trending.dart';
import 'package:tmbd/widgets/tv.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tmdb_api/tmdb_api.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingMovies = [];

  List topratedMovies = [];

  List tv = [];

  final String apiKey = "a3605c3fe96443ea59d0521456def3ac";

  final String readAccesToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMzYwNWMzZmU5NjQ0M2VhNTlkMDUyMTQ1NmRlZjNhYyIsInN1YiI6IjYxNDJkNzM2NTZiOWY3MDA0NTAwOTg0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9urm0UmOni19zWsRM0mS3O_xtZyPC_oEggYLZMz6IC4";

  @override
  void initState() {
    super.initState();

    loadmovies();
  }

  loadmovies() async {
    TMDB  tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccesToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();

    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {

      trendingMovies = trendingresult['results'];

      topratedMovies = topRatedResult['results'];

      tv = tvresults['results'];

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        title: modifiedText(text:"AP ❤️️ Movies Application", size: 12, color: Colors.white,),
        backgroundColor: Colors.transparent,
      ),

      body: ListView(

        children: [

          TrendingMovies(trending: trendingMovies),

          TopRatedMovies(topratedmovies: topratedMovies),

          TV(tv: tv)

        ],
        
      ),
    );
  }
}