import 'package:flutter/material.dart';
import 'package:tmbd/utils/text.dart';

class Description extends StatelessWidget {

  final String name, description, bannerurl, posterurl, vote, launch_date;

  const Description({ 
    Key? key, 
    required this.name, 
    required this.description, 
    required this.bannerurl, 
    required this.posterurl, 
    required this.vote, 
    required this.launch_date }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        child: ListView(  
          children: [

            Container(
              height: 250,
              child: Stack(  
                children: [

                  Positioned(child: Container(  
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover,),
                  )),

                  Positioned(
                    bottom: 10,
                    child: modifiedText(
                    text: '  ⭐ Average Rating - ' + vote,
                    size: 18,
                    color: Colors.white,)),  
                ],
              ),
            ),

            SizedBox(height: 15,),

            Container(
              padding: EdgeInsets.all(10),
              child: modifiedText(
                text: name!=null ? name : 'Not Loaded',
                size: 24,
                color: Colors.white,),
            ),

            Container(
              padding: EdgeInsets.only(left: 10),
              child: modifiedText(
                text: 'Releasing On - ' + launch_date,
                size: 14,
                color: Colors.white,),
            ),

            Row(  
              children: [

                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),

                Flexible(
                  child: Container(
                    child: modifiedText(
                      text: description, 
                      size: 18, 
                      color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}