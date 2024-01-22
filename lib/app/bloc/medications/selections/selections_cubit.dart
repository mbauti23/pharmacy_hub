import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionsCubit extends Cubit<List<String>> {
  SelectionsCubit() : super([]);

  void add(String selection) {
    emit(List.from(state)..add(selection));
  }

  void remove(String selection) {
    emit(List.from(state)..remove(selection));
  }
}
