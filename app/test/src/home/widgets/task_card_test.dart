import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final taskBoard = TaskBoardModel(
    Uuid.v4(),
    'Nova lista',
  );

  final tasks = [
    TaskModel(Uuid.v4(), 'Lista 1', completed: true),
    TaskModel(Uuid.v4(), 'Lista 2', completed: true),
    TaskModel(Uuid.v4(), 'Lista 3', completed: true),
    TaskModel(Uuid.v4(), 'Lista 4'),
    TaskModel(Uuid.v4(), 'Lista 5'),
  ];

  testWidgets('TaskCard => getProgress', (tester) async {
    final progress = TaskCard(
      taskBoard: taskBoard,
    ).getProgress(tasks);

    expect(progress, 0.6);
  });

  testWidgets('TaskCard => getProgressText', (tester) async {
    final progress = TaskCard(
      taskBoard: taskBoard,
    ).getProgressText(tasks);

    expect(progress, '3/5');
  });
}
