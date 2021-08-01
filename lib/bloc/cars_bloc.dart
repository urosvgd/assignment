import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:moja_garaza/models/car.dart';
import 'package:moja_garaza/repository/cars_repository.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  FakeCarsRepository fakeCarRepository;

  CarsBloc(this.fakeCarRepository) : super(CarsInitial());

  @override
  Stream<CarsState> mapEventToState(
    CarsEvent event,
  ) async* {
    yield CarsLoading();
    if (event is GetCars) {
      try {
        final cars = await fakeCarRepository.fetchCars();
        yield CarsLoaded(cars);
      } catch (error) {
        yield CarsError("Nismo mogli uzeti podatke o vozilima");
      }
    }
  }
}
