import 'package:flutter_bloc/flutter_bloc.dart';

class CityCubit extends Cubit<String> {
  CityCubit() : super('');

  void changeQuery(String value) => emit(value);
}
