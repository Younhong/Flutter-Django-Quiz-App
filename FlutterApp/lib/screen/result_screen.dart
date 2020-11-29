import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/screen/home_screen.dart';

class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizzes;
  ResultScreen({this.answers, this.quizzes});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for (int i = 0; i < quizzes.length; i++) {
      if (quizzes[i].answer == answers[i]) {
        score += 1;
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Quiz App"),
            backgroundColor: Colors.deepPurple,
            leading: Container(),
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.deepPurple),
                  color: Colors.deepPurple
              ),
              width: width * .85,
              height: height * .7,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: width * .048),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.deepPurple
                        ),
                        color: Colors.white
                    ),
                    width: width * .73,
                    height: height * .40,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, width * .048, 0, width * .048
                          ),
                          child: Text("수고하셨습니다",
                            style: TextStyle(
                                fontSize: width * .055,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Text("당신의 점수는",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * .048
                          ),),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          score.toString() + '/' + quizzes.length.toString(),
                          style: TextStyle(
                              fontSize: width * .21,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * .012),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: width * .048),
                    child: ButtonTheme(
                      minWidth: width * .73,
                      height: height * .05,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen()
                          ));
                        },
                        child: Text("홈으로 돌아가기"),
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}