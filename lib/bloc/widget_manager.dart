import 'package:home_widget/home_widget.dart';
import 'package:word_widget/bloc/word.dart';

class WidgetManager {
  static Future<void> setWord(Word word) async {
    String wordText = word.word;
    String descriptionText = word.description;

    HomeWidget.saveWidgetData(
      'title',
      wordText,
    );
    HomeWidget.saveWidgetData(
      'message',
      descriptionText,
    );
    HomeWidget.updateWidget(name: 'WidgetProvider');
  }
}
