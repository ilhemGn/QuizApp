import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String textbutton;
  final void Function() pressFct;
  final IconData icon;

  const RoundedButton({
    required this.textbutton,
    required this.pressFct,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Color(0xffAA4983),
            Color.fromARGB(255, 145, 100, 147),
            Color.fromARGB(255, 88, 62, 141),
          ])),
      child: TextButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        onPressed: pressFct,
        label: Text(
          textbutton,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
