part of 'mtg_bloc.dart';

abstract class MTGEvent extends Equatable {
  const MTGEvent();

  @override
  List<Object> get props => [];
}

class Initialize extends MTGEvent {}
