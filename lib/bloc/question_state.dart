part of 'question_bloc.dart';

@immutable
abstract class QuestionState {
  final int totalQuestions;
  final int rightAnswer;

  const QuestionState(
      {required this.rightAnswer, required this.totalQuestions});
}

class QuestionInitial extends QuestionState {
  const QuestionInitial({required int totalQuestions, required int rightAnswer})
      : super(rightAnswer: rightAnswer, totalQuestions: totalQuestions);
}
