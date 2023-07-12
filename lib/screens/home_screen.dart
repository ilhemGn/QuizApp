import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 45, 85),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 40, 45, 85),
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
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Opacity(
              opacity: 0.8,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/DidYouKnow.png',
                  width: 200,
                  //height: 200,
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
            const QuestionNumber(),
            const SizedBox(height: 30),
            const Text(
              'Question text....',
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 15),
            AnswerButton(
              answerText: 'answer1....',
              onTap: () {},
            ),
            AnswerButton(
              answerText: 'answer1....',
              onTap: () {},
            ),
            AnswerButton(
              answerText: 'answer1....',
              onTap: () {},
            ),
            AnswerButton(
              answerText: 'answer1....',
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration:
              BoxDecoration(gradient: kGradient, shape: BoxShape.circle),
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(36, 242, 239, 239),
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              '2',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(36, 242, 239, 239),
          ),
          child: const CircleAvatar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
            child: Text(
              '3',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
