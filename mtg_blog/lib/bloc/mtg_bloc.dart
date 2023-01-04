import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mtg_events.dart';
part 'mtg_states.dart';

class MTGBloc extends Bloc<MTGEvent, MTGState> {
  late String username;
  MTGBloc() : super(const InitialState()) {
    on<Initialize>(initialize);
  }
  void initialize(Initialize event, Emitter<MTGState> emit) async {
    emit(const InitialState());
  }
}
