part of 'tasks_cubit.dart';

@immutable
sealed class TasksState extends Equatable {
  final List<TasksModel> tasks;

  const TasksState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

final class TasksInitial extends TasksState {
  TasksInitial() : super([]);
}

final class UpdateTasks extends TasksState {
  const UpdateTasks(super.tasks);
}
