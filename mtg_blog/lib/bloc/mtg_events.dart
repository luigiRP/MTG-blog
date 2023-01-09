part of 'mtg_bloc.dart';

abstract class MTGEvent extends Equatable {
  const MTGEvent();

  @override
  List<Object> get props => [];
}

class Initialize extends MTGEvent {
  const Initialize();
}

class LoadData extends MTGEvent {
  final String name;
  final String surname;
  final DateTime date;
  final String email;

  const LoadData(
      {required this.name,
      required this.surname,
      required this.date,
      required this.email});
}

class LoadCards extends MTGEvent {
  const LoadCards();
}

class CardDescription extends MTGEvent {
  final MTGCard card;

  const CardDescription({required this.card});
}
