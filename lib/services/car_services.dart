import 'package:moja_garaza/models/car.dart';
import 'package:moja_garaza/repository/cars_repository.dart';

class CarService {
  final CarRepository carRepository;

  CarService(this.carRepository);

  Future<List<Car>> getAllCars() async {
    return await carRepository.fetchCars();
  }

  Future<List<Car>> getCarByColor(String color) async {
    List<Car> allCars = await carRepository.fetchCars();
    List<Car> searchedCars = [];
    for (var c in allCars) {
      if (c.color.toLowerCase() == color.toLowerCase() || c.color.toLowerCase().contains(color)) {
        searchedCars.add(c);
      }
    }

    return searchedCars;
  }

  Future<List<Car>> getCarByModel(String model) async {
    List<Car> allCars = await carRepository.fetchCars();
    List<Car> searchedCars = [];
    for (var c in allCars) {
      if (c.carModel.toLowerCase() == model.toLowerCase() || c.carModel.toLowerCase().contains(model)) {
        searchedCars.add(c);
      }
    }

    return searchedCars;
  }
}
