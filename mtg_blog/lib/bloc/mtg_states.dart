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
