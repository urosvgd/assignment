part of 'cars_bloc.dart';

@immutable
abstract class CarsState extends Equatable {
  CarsState();

  @override
  List<Object> get props => [];
}

class CarsInitial extends CarsState {
  CarsInitial();
}

class CarsLoading extends CarsState {
  CarsLoading();
  @override
  List<Object> get props => [];
}

class CarsError extends CarsState {
  final String message;
  CarsError(this.message);
  @override
  List<Object> get props => [message];
}

class CarsLoaded extends CarsState {
  final List<Car> cars;
  CarsLoaded(this.cars);
  @override
  List<Object> get props => [cars];
}
