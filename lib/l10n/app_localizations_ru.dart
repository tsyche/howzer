// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get language => 'Язык';

  @override
  String get englishUs => 'Английский (США)';

  @override
  String get englishUk => 'Английский (Великобритания)';

  @override
  String get spanish => 'Испанский';

  @override
  String get german => 'Немецкий';

  @override
  String get russian => 'Русский';

  @override
  String get appName => 'Howzer';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get customizeExperience => 'Настройте свой опыт Howzer';

  @override
  String get goodMorning => 'Доброе утро';

  @override
  String get goodAfternoon => 'Добрый день';

  @override
  String get goodEvening => 'Добрый вечер';

  @override
  String tasksCompletedToday(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count задач выполнено сегодня!',
      many: '$count задач выполнено сегодня!',
      few: '$count задачи выполнены сегодня!',
      one: '1 задача выполнена сегодня!',
      zero: 'Пока нет задач',
    );
    return '$_temp0 🎉';
  }

  @override
  String get showCompletedTasks => 'Показать завершённые задачи';

  @override
  String get displayFinishedTasks => 'Отображать завершённые задачи';

  @override
  String get clearCompletedTasks => 'Очистить завершённые задачи';

  @override
  String removeFinishedTasks(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count завершённых задач',
      many: 'Удалить $count завершённых задач',
      few: 'Удалить $count завершённые задачи',
      one: 'Удалить 1 завершённую задачу',
    );
    return '$_temp0';
  }

  @override
  String get nothingToClear => 'Нечего очищать';

  @override
  String get completeSomeTasks => 'Сначала завершите несколько задач';

  @override
  String get taskCompleted => 'Задача завершена';

  @override
  String get taskDeleted => 'Задача удалена';

  @override
  String get madeWithLove => 'Создано с помощью Flutter';

  @override
  String get privacyMessage => '🔒 Все ваши данные остаются на устройстве — без облака, без отслеживания.';
}
