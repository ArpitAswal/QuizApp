import 'package:flutter/material.dart';
import 'package:mcq/main.dart';

class resultPage extends StatelessWidget {
  int totalscore = 0;
  String username = '';

  resultPage(String name, int score) {
    username = name;
    totalscore = score;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xffe7bf74),
          Color(0xfffcb69f),
        ],
        begin: FractionalOffset(1.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello $username",
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent),
              //textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ), //Text
            Text(
              'Your Score is ' '$totalscore',
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent),
             // textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            if (totalscore == 5) Text('😇', style: TextStyle(fontSize: 40)),
            if (totalscore == 4) Text('😀', style: TextStyle(fontSize: 40)),
            if (totalscore == 3) Text('🙂', style: TextStyle(fontSize: 40)),
            if (totalscore == 2) Text('😔', style: TextStyle(fontSize: 40)),
            if (totalscore == 1) Text('😢', style: TextStyle(fontSize: 40)),
            if (totalscore == 0) Text('😭', style: TextStyle(fontSize: 40)),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                title: '',
                              )));
                },
                child: Text(
                  'Restart Quiz',
                ),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all(Colors.red.shade600),
                  shadowColor: MaterialStateProperty.all(Colors.black54),
                  elevation: MaterialStateProperty.all(15),
                  side: MaterialStateProperty.all(const BorderSide(
                    width: 2,
                    color: Colors.deepOrangeAccent,
                  )),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                )),
          ], //<Widget>[]
        ), //Column
      ),
    ); //Center
  }
}
