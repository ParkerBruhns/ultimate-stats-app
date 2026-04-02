import 'package:flutter/material.dart';

int numTeams = 4;

class GamesHistory extends StatelessWidget {
  const GamesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 32.0),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(/* color: Color(0xff000000),  */width: 3.0),
      ),
      child: Column(
        children: [
          Title(
            child: Text("Games History", style: TextStyle(fontSize: 16.0)),
            color: Color(0xff000000),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                gameConstructor(Icons.man, "Man Icon", 5.0),
                gameConstructor(Icons.icecream, "Icecream Icon", 5.0),
                gameConstructor(Icons.book, "Reader", 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container gameConstructor(IconData? icon, String text, double padding) {
  return Container(
    child: ListTile(
      leading: Icon(icon),
      title: Text(text),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0)),
      // tileColor: Color(0xffeeeeee),
      // textColor: Color(0xff000000),
      // iconColor: Color(0xffffdd00),
      contentPadding: EdgeInsets.all(padding),
    ),
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0.0),
      border: Border.all(/* color: Color(0xff000000), */ width: 0.5),
    ),
  );
}
