import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({Key? key}) : super(key: key);

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
              leading: Icon(Icons.question_answer),
              title: Text('jeito'),
              subtitle: Text('way, style, manner'),
            ),
          ],
        ),
      ),
    );
  }
}
