import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_blog/api/api_cards.dart';
import 'package:mtg_blog/models/card_list_model.dart';

part 'mtg_events.dart';
part 'mtg_states.dart';

class MTGBloc extends Bloc<MTGEvent, MTGState> {
  String? name;
  String? surname;
  String? email;
  DateTime date = DateTime.now();

  MTGBloc() : super(const InitialState()) {
    on<Initialize>(initialize);
    on<LoadData>(loadData);
  }
  void initialize(Initialize event, Emitter<MTGState> emit) async {
    emit(InitialState(name: name, surname: surname, email: email, date: date));
  }

  void loadData(LoadData event, Emitter<MTGState> emit) async {
    emit(const LoadingState());
    name = event.name;
    surname = event.surname;
    date = event.date;
    email = event.email;

    CardList cards = await CardAPI.getCards();

    emit(CardBlogState(cards: cards));
  }
}
