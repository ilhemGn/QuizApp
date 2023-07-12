import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/questions_summary.dart';
import 'package:quiz_app/widgets/rounded_button.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/data/question_data.dart';

class ResultScreen extends StatelessWidget {
  final List<String> answers;
  ResultScreen({required this.answers, super.key});

  final QuestionData questionData = QuestionData();

//getter
  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionData.getQstText(i),
        'correct_answer': questionData.getAnswers(i)[0],
        'user_answer': answers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final nbrQst = questionData.lenght;
    final nbrCorrectAnswers = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return Scaffold(
      backgroundColor: kMainColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/congrats.png'),
            alignment: Alignment.topCenter,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Congrats! You Did It',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Text(
                'You answered $nbrCorrectAnswers of $nbrQst questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 20),
              QuestionsSummary(summary: summaryData),
              const SizedBox(height: 30),
              RoundedButton(
                icon: Icons.refresh,
                textbutton: 'Restart',
                pressFct: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
