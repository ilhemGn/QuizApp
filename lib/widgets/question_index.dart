import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class QuestionIndex extends StatelessWidget {
  final String index;
  final bool isCorrect;

  const QuestionIndex({
    required this.index,
    required this.isCorrect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: isCorrect ? kGradientColor : kSimpleColor,
        shape: BoxShape.circle,
        color: isCorrect ? null : kTrasparentColor,
      ),
      child: Text(
        index,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
