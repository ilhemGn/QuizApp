import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/question_index.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;
  const QuestionsSummary({required this.summary, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(69, 255, 255, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: summary
              .map((data) => Row(
                    children: [
                      QuestionIndex(
                          index:
                              ((data['question_index'] as int) + 1).toString(),
                          isCorrect:
                              data['user_answer'] == data['correct_answer']),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data['user_answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 194, 182, 223),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 141, 191, 172),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
