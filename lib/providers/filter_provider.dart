import 'package:flutter_riverpod/legacy.dart' show StateProvider;

enum TaskViewFilter { Daily, Weekly, Monthly, All }

final filterProvider = StateProvider<TaskViewFilter>((ref) {
  return TaskViewFilter.All;
});
