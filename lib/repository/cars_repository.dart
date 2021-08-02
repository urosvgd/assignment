import 'package:moja_garaza/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}

class FakeCarsRepository implements CarRepository {
  final List<Car> cars = [
    Car(
        carProducer: "BMW",
        carModel: "BMW",
        color: "Crveno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Audi",
        carModel: "Audi e-tron",
        color: "Zeleno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Bugatti",
        carModel: "16/4 Veyron Concept",
        color: "Plavo",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Fiat",
        carModel: "500",
        color: "Siva",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Skoda",
        carModel: "Kushaq",
        color: "Ljubicasto",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Volvo",
        carModel: "xc90",
        color: "Roze",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Volga",
        carModel: "m24",
        color: "Crno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Tata",
        carModel: "Safari",
        color: "Crvena",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Toyota",
        carModel: "Avalon",
        color: "Plavo",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Peugeot",
        carModel: "Sedan",
        color: "Crveno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Audi",
        carModel: "A4",
        color: "Zeleno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Skoda",
        carModel: "Fabia",
        color: "Ljubicasto",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Skoda",
        carModel: "Kushaq",
        color: "Ljubicasto",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Volvo",
        carModel: "xc90",
        color: "Roze",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Volga",
        carModel: "m24",
        color: "Crno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Tata",
        carModel: "Safari",
        color: "Crveno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Toyota",
        carModel: "Avalon",
        color: "Plavo",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Peugeot",
        carModel: "Sedan",
        color: "Crveno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Audi",
        carModel: "A4",
        color: "Zeleno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Skoda",
        carModel: "Fabia",
        color: "Ljubicasta",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Skoda",
        carModel: "Kushaq",
        color: "Ljubicasta",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Volvo",
        carModel: "xc90",
        color: "Roza",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Volga",
        carModel: "m24",
        color: "Crna",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Tata",
        carModel: "Safari",
        color: "Crveno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Toyota",
        carModel: "Avalon",
        color: "Plava",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Peugeot",
        carModel: "Sedan",
        color: "Crveno",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Audi",
        carModel: "A4",
        color: "Zelena",
        plateNumber: "BG 333 222"),
    Car(
        carProducer: "Skoda",
        carModel: "Fabia",
        color: "Ljubicasta",
        plateNumber: "BG 333 222"),
  ];
  @override
  Future<List<Car>> fetchCars() {
    // Simulate network delay
    return Future.delayed(
      Duration(milliseconds: 600),
      () {
        return cars;
      },
    );
  }
}

class AnotherFakeCarRepository implements CarRepository {
  @override
  Future<List<Car>> fetchCars() {
    throw UnimplementedError();
  }
}

class SQLCarRepository implements CarRepository {
  @override
  Future<List<Car>> fetchCars() {
    throw UnimplementedError();
  }
}

class HttpCarRepository implements CarRepository {
  @override
  Future<List<Car>> fetchCars() {
    // TODO: implement fetchCars
    throw UnimplementedError();
  }
}

class NetworkError extends Error {}
