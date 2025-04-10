sealed class TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final String title;

  AddTaskEvent(this.title);
}

class RemoveTaskEvent extends TasksEvent {
  final String id;

  RemoveTaskEvent(this.id);
}

class ToggleTaskEvent extends TasksEvent {
  final String id;

  ToggleTaskEvent(this.id);
}
