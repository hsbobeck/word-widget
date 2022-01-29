import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:word_widget/bloc/database_manager.dart';

import 'bloc/word.dart';
import 'word_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WordWidgetApp());
}

class WordWidgetApp extends StatelessWidget {
  const WordWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Widget',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(
        title: 'Word Widget - Portuguese',
        dbManager: DatabaseManager(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.dbManager})
      : super(key: key);

  final String title;
  final DatabaseManager dbManager;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _refreshWord() {
    setState(() {
      // TODO
    });
    HomeWidget.saveWidgetData(
      'title',
      'borboleta',
    );
    HomeWidget.saveWidgetData(
      'message',
      'butterfly',
    );
    HomeWidget.updateWidget(name: 'WidgetProvider');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
            future: widget.dbManager.getRandomWord(),
            initialData: const Word(word: '', description: ''),
            builder: (context, AsyncSnapshot<Word> snapshot) {
              return WordCard(word: snapshot.data!);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshWord,
        tooltip: 'New Word',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
