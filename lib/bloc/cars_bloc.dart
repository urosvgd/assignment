import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:moja_garaza/models/car.dart';
import 'package:moja_garaza/services/car_services.dart';
import 'package:connectivity/connectivity.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarService carService;

  CarsBloc(this.carService) : super(CarsInitial());

  @override
  Stream<CarsState> mapEventToState(
    CarsEvent event,
  ) async* {
    yield CarsLoading();

    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    bool isConnected = connectivityResult != ConnectivityResult.none;
   

    if (event is GetCarsEvent) {
      try {
        final cars = await carService.getAllCars(isConnected);
        yield CarsLoaded(cars);
      } catch (error) {
        print("getAllCars");
        print(error);
        yield CarsError("Nismo mogli uzeti podatke o vozilima");
      }
    }

    List<Car> filteredCars = [];

    if (event is SearchCarsByColorEvent) {
      try {
        filteredCars = await carService.getCarByColor(event.color, isConnected);
        yield CarsLoaded(filteredCars);
      } catch (error) {
        print("getCarByColor");
        print(error);

        yield CarsError("Nismo mogli uzeti podatke o vozilima");
      }
    }

    if (event is SearchCarsByModelEvent) {
      try {
        filteredCars = await carService.getCarByModel(event.model, isConnected);
        yield CarsLoaded(filteredCars);
      } catch (error) {
        print("getCarByModel");
        print(error);

        yield CarsError("Nismo mogli uzeti podatke o vozilima");
      }
    }
  }
}
