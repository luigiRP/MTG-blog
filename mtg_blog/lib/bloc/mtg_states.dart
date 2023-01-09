part of 'mtg_bloc.dart';

class MTGState extends Equatable {
  const MTGState();

  @override
  List<Object> get props => [];
}

class InitialState extends MTGState {
  const InitialState({this.name, this.surname, this.email, this.date});

  final String? name;
  final String? surname;
  final String? email;
  final DateTime? date;

  @override
  List<Object> get props => [];
  @override
  String toString() => 'Initial State';
}

class LoadingState extends MTGState {
  const LoadingState();
  @override
  String toString() => 'Loading State';
}

class CardBlogState extends MTGState {
  const CardBlogState({required this.cards});

  final CardList cards;
  @override
  String toString() => 'Card Blog State';
}

class CardDescriptionState extends MTGState {
  const CardDescriptionState({required this.card});

  final MTGCard card;
  @override
  String toString() => 'Card Description State';
}

class ErrorState extends MTGState {
  @override
  String toString() => 'Error State';
}
