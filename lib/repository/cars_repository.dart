import 'package:moja_garaza/models/car.dart';
import 'package:moja_garaza/models/car.dart' as car;

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}

class FakeCarsRepository implements CarRepository {
  @override
  Future<List<Car>> fetchCars() {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 3),
      () {
        return car.cars;
      },
    );
  }
}

class NetworkError extends Error {}
