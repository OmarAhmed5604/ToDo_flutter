part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}
final class TodoAdd extends TodoState{}
final class TodoCheck extends TodoState{}
final class TodoDelete extends TodoState{}

final class TodoEdit extends TodoState{}
