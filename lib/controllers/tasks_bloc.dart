import 'dart:async';

import 'package:bloc_cubit/controllers/tasks_event.dart';
import 'package:bloc_cubit/models/tasks_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {
    on<AddTaskEvent>(_addTaskEvent);

    on<RemoveTaskEvent>(_removeTask);

    on<ToggleTaskEvent>(_toggleTask);
  }

  FutureOr<void> _addTaskEvent(AddTaskEvent event, Emitter<TasksState> emit) {
    final model = TasksModel(
      id: Uuid().v4(),
      title: event.title,
      isCompleted: false,
    );
    emit(UpdateTasks([...state.tasks, model]));
  }

  FutureOr<void> _removeTask(RemoveTaskEvent event, Emitter<TasksState> emit) {
    final List<TasksModel> newList =
        state.tasks.where((task) => task.id != event.id).toList();
    emit(UpdateTasks(newList));
  }

  FutureOr<void> _toggleTask(ToggleTaskEvent event, Emitter<TasksState> emit) {
    final List<TasksModel> newList =
        state.tasks.map((tasks) {
          return tasks.id == event.id
              ? tasks.copyWith(isCompleted: !tasks.isCompleted)
              : tasks;
        }).toList();
    emit(UpdateTasks(newList));
  }
}
