part of 'cars_bloc.dart';

@immutable
abstract class CarsEvent extends Equatable {
  CarsEvent();
  @override
  List<Object> get props => [];
}

class GetCarsEvent extends CarsEvent {}


class SearchCarsByColorEvent extends CarsEvent {
  final String color;
  SearchCarsByColorEvent(this.color);
}

class SearchCarsByModelEvent extends CarsEvent {
  final String model;
  SearchCarsByModelEvent(this.model);
}

