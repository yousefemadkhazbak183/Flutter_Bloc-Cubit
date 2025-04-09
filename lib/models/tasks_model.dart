import 'package:equatable/equatable.dart';

class TasksModel extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;

  TasksModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, title, isCompleted];

  TasksModel copyWith({String? id, String? title, bool? isCompleted}) {
    return TasksModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
