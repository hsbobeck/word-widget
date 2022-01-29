import 'package:flutter/material.dart';

import 'bloc/word.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    required this.word,
    Key? key,
  }) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: Text(word.word),
              subtitle: Text(word.description),
            ),
          ],
        ),
      ),
    );
  }
}
