import 'dart:async';
import 'package:moja_garaza/models/car.dart';
import 'package:moja_garaza/repository/cars_repository.dart';

class CarService {
  CarRepository? onlineRepository;
  CarRepository? offlineRepository;

  CarService({
    this.onlineRepository,
    this.offlineRepository,
  });

  Future<List<Car>> getAllCars(bool isConnected) async {
    late List<Car> cars = [];
    print(isConnected);
    if (isConnected) {
      List<Car> carDifference = [];
      cars = await onlineRepository!.fetchCars();
      List<Car> offlineCars = await offlineRepository!.fetchCars();
      
      carDifference = _getCarDifference(cars, offlineCars);
      _saveCarDifference(carDifference);
    } else {
      cars = await offlineRepository!.fetchCars();
    }      
    
    print("CARS LENGTH FROM SERVICE  ${cars.length}");

    return cars;
  }

  void _saveCarDifference(List<Car> carDifferences) {
    for (var car in carDifferences) {
      offlineRepository!.addCar(car);
    }
  }

  List<Car> _getCarDifference(List<Car> cars, List<Car> offlineCars) {
    List<Car> carDifference = [];
    cars.forEach((element) {
      if (!offlineCars.contains(element)) {
        carDifference.add(element);
      }
    });
    return carDifference;
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
      List<Car> allCars = await offlineRepository!.fetchCars();
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
