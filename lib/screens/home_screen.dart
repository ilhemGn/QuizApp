import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:quiz_app/widgets/question_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuestionData questionData = QuestionData();
  int currentIndexQuestion = 0;
  List<String> answersU = [];

  List<QuestionIndex> questionsIndex() {
    List<QuestionIndex> qstIndex = [];
    for (var i = 1; i <= questionData.lenght; i++) {
      setState(() {});
      qstIndex.add(QuestionIndex(
        index: '$i',
        isCorrect: currentIndexQuestion + 1 >= i,
      ));
    }
    return qstIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Live Quiz',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Opacity(
              opacity: 0.65,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/DidYouKnow.png',
                  width: 250,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Flutter Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: questionsIndex(),
            ),
            const SizedBox(height: 25),
            Text(
              questionData.getQstText(currentIndexQuestion),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            ...questionData
                .getShuffledAnswers(currentIndexQuestion)
                .map((answer) => AnswerButton(
                      answerText: answer,
                      onTap: () {
                        setState(() {
                          answersU.add(answer);
                          answersU.length != questionData.lenght
                              ? currentIndexQuestion++
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResultScreen(answers: answersU)));
                        });
                      },
                    )),
          ],
        ),
      ),
    );
  }
}
