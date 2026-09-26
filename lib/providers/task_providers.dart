import 'package:flutter_riverpod/legacy.dart' show StateProvider;

// Controls whether completed tasks are shown
final showCompletedTasksProvider = StateProvider<bool>((ref) => false);
