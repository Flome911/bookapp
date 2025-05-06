import 'package:bloc/bloc.dart';
import 'package:bookapp/data/models/Book.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState([])) {
    on<AscendingEvent>((event, emit) {
      emit(FilterState([]));
    });
  }
}
