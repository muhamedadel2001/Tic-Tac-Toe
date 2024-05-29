part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class GetRandom extends HomeState {}
class AddToBoard extends HomeState {}
class EndGameWin extends HomeState {}
class EndGameDraw extends HomeState {}
class ResetGame extends HomeState {}
class ChangeLevelMode extends HomeState {}
class AddTemp extends HomeState {}
