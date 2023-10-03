import 'package:flutter/material.dart';

class CardPhase extends StatelessWidget {
  final title;
  final Color color;
  const CardPhase({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 20.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 69,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5 * 2),
              ),
            ),
          ]),
    );
  }
}
