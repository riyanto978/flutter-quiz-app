import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc()
      : super(
          const QuestionInitial(rightAnswer: 0, totalQuestions: 5),
        ) {
    on<AnswerQuestion>(
      (event, emit) {
        if (event.status == true) {
          emit(
            QuestionInitial(
                totalQuestions: state.totalQuestions,
                rightAnswer: state.rightAnswer + 1),
          );
        } else {
          emit(
            QuestionInitial(
                totalQuestions: state.totalQuestions,
                rightAnswer: state.rightAnswer),
          );
        }
      },
    );
  }
}
