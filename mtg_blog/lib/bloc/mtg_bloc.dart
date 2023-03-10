import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_blog/api/api_cards.dart';
import 'package:mtg_blog/models/card_list_model.dart';
import 'package:mtg_blog/models/card_model.dart';

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
    on<LoadCards>(loadCards);
    on<CardDescription>(cardDescription);
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
    try {
      Map<String, dynamic> res = await CardAPI.getCards();

      var statusCode = res['status_code'];
      CardList cards = res['cards'];

      if (statusCode == 200) {
        emit(CardBlogState(cards: cards));
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  void loadCards(LoadCards event, Emitter<MTGState> emit) async {
    emit(const LoadingState());
    try {
      Map<String, dynamic> res = await CardAPI.getCards();

      var statusCode = res['status_code'];
      CardList cards = res['cards'];

      if (statusCode == 200) {
        emit(CardBlogState(cards: cards));
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  void cardDescription(CardDescription event, Emitter<MTGState> emit) {
    emit(CardDescriptionState(card: event.card));
  }

  void updateValues(
      String newName, String newSurname, String newEmail, DateTime newDate) {
    name = newName;
    surname = newSurname;
    date = newDate;
    email = newEmail;
  }
}
