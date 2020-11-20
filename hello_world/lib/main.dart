import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  
  home: Home()

));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(

        appBar: AppBar(

          title: Text("My First App"),
          centerTitle: true,
          backgroundColor: Colors.orange[600],

       ),
        body: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [

                Container (
                
                  color: Colors.red,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(4),
                
                ),
                Container (
                
                  color: Colors.green,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(4),
                
                ),
                Container (
                
                  color: Colors.blue,
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(4),
                
                )

              ],

            ),
            Icon(
              
              Icons.house,
              size: 75,
              color: Colors.grey[800],
              
              )

          ],

       ),
        floatingActionButton: FloatingActionButton(

          child: Text("Click"),
          backgroundColor: Colors.orange[600],
          onPressed: () {

          },

       ),

     )

    ;
  }
}