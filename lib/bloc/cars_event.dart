part of 'cars_bloc.dart';

@immutable
abstract class CarsEvent extends Equatable {
  CarsEvent();
  @override
  List<Object> get props => [cars];
}

class GetCars extends CarsEvent {}
