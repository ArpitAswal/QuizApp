import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mcq/resultPage.dart';

class Play {
  String question;
  List<String> answer;

  Play({required this.question, required this.answer});
}

String username = '';

class playQuiz extends StatefulWidget {
  playQuiz(String text) {
    username = text;
  }

  @override
  State<playQuiz> createState() => _playQuizState();
}

class _playQuizState extends State<playQuiz> {
  int questionindex = -1;
  int answerindex = 0;
  late int option;
  List<Play> quiz = [
    Play(
      question: 'Q1. Who created Flutter?',
      answer: ['Facebook', 'Adobe', 'Google', 'Microsoft'],
    ),
    Play(
      question: 'Q2. What is Flutter?',
      answer: [
        'Android Development Kit',
        'IOS Development Kit',
        'Web Development Kit',
        'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
      ],
    ),
    Play(
      question: ' Q3. Which programing language is used by Flutter',
      answer: [
        'Ruby',
        'Dart',
        'C++',
        'Kotlin',
      ],
    ),
    Play(
      question: 'Q4. Who created Dart programing language?',
      answer: [
        'Lars Bak and Kasper Lund',
        'Brendan Eich',
        'Bjarne Stroustrup',
        'Jeremy Ashkenas',
      ],
    ),
    Play(
      question: 'Q5. Is Flutter cross-platform or not',
      answer: [
        'True',
        'False',
      ],
    ),
  ];
  @override
  void initState() {
    _statechange();
  }

  void _statechange() {
    setState(() {
      if (questionindex >= 4) {
        questionindex = 0;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => resultPage(username, score)));
      } else
        questionindex = questionindex + 1;
      answerindex = 0;

      print('statechange,questionindex= $questionindex');
    });
  }

  int score = 0;

  void _correct(int qindex, int option) {
    print('qindex=$qindex' 'option=${option+1}');
    if ((qindex == 0 && option == 2) ||
        (qindex == 1 && option == 3) ||
        (qindex == 2 && option == 1) ||
        (qindex == 3 && option == 0) ||
        (qindex == 4 && option == 0)) {
      score++;
      print('score=$score');
    }

    /* if(qindex==3) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => resultPage(username, score)));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // title: const Text('Geeks for Geeks'),
          backgroundColor: const Color(0xFF00E676),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(quiz[questionindex].question.toString(),
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
            SizedBox(
              height: 15,
            ),
            for (int i = 0; i < quiz[questionindex].answer.length; i++)
              GestureDetector(
                onTap: () {
                  _correct(questionindex, i);
                  _statechange();
                },
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                        child: Text(
                          quiz[questionindex].answer[answerindex++],
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                  ),
                ),
              ),

            SizedBox(
              height: 20,
            ),
             ElevatedButton(
                    onPressed: () {
                      _statechange();
                    },
                    child: (questionindex<4)?Text('Next'):Text('Submit'),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                      shadowColor: MaterialStateProperty.all(Colors.black54),
                      elevation: MaterialStateProperty.all(10),
                      side: MaterialStateProperty.all(const BorderSide(
                        width: 2,
                        color: Colors.black26,
                      )),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    )
          ],
        ),
      ),
    );
  }
}
