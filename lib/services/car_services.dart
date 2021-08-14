import 'dart:async';

import 'package:moja_garaza/models/car.dart';
import 'package:moja_garaza/repository/cars_repository.dart';

class CarService {
  // CarRepository? carRepository;
  CarRepository? onlineRepository;
  CarRepository? offlineRepository;

  // DioCarRepository? onlineRepository;
  // NoSqlCarRepository? offlineRepository;

  CarService({
    this.onlineRepository,
    this.offlineRepository,
  });

  Future<List<Car>> getAllCars(bool isConnected) async {
    late List<Car> cars = [];
    if (isConnected) {
      cars = await onlineRepository!.fetchCars();
    } else {
      cars = await offlineRepository!.fetchCars();
    }

    return cars;
  }

  Future<List<Car>> getCarByColor(String color, bool isConnected) async {
    List<Car> searchedCars = [];
    if (isConnected) {
      List<Car> allCars = await onlineRepository!.fetchCars();
      for (var c in allCars) {
        if (c.color.toLowerCase() == color.toLowerCase() ||
            c.color.toLowerCase().contains(color)) {
          searchedCars.add(c);
        }
      }
    } else {
      List<Car> allCars = await offlineRepository!.fetchCars();
      for (var c in allCars) {
        if (c.color.toLowerCase() == color.toLowerCase() ||
            c.color.toLowerCase().contains(color)) {
          searchedCars.add(c);
        }
      }
    }
    return searchedCars;
  }

  Future<List<Car>> getCarByModel(String model, bool isConnected) async {
    List<Car> searchedCars = [];
    if (isConnected) {
      List<Car> allCars = await onlineRepository!.fetchCars();
      for (var c in allCars) {
        if (c.carModel.toLowerCase() == model.toLowerCase() ||
            c.carModel.toLowerCase().contains(model)) {
          print(c);
          searchedCars.add(c);
        }
      }
    } else {
      List<Car> allCars = await onlineRepository!.fetchCars();
      for (var c in allCars) {
        if (c.carModel.toLowerCase() == model.toLowerCase() ||
            c.carModel.toLowerCase().contains(model)) {
          print(c);
          searchedCars.add(c);
        }
      }
    }

    return searchedCars;
  }
}
