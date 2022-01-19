part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class AnswerQuestion extends QuestionEvent {
  final bool status;

  AnswerQuestion(this.status);
}
