import 'dart:convert';

import 'package:moja_garaza/data/database_helperV2.dart';
import 'package:moja_garaza/models/car.dart';
import 'package:http/http.dart' as http;

abstract class CarRepository {
  Future<List<Car>> fetchCars();
  Future<Car> createCar();
}

class FakeCarRepository implements CarRepository {
  final List<Car> cars = [
    Car(
        sId: "1",
        v: 0,
        carProducer: "BMW",
        carModel: "BMW",
        color: "Crveno",
        plateNumber: "BG 333 222"),
    Car(
        sId: "2",
        v: 0,
        carProducer: "Audi",
        carModel: "Audi e-tron",
        color: "Zeleno",
        plateNumber: "BG 333 222"),
    Car(
        sId: "3",
        v: 0,
        carProducer: "Bugatti",
        carModel: "16/4 Veyron Concept",
        color: "Plavo",
        plateNumber: "BG 333 222")
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

  @override
  Future<Car> createCar() {
    // TODO: implement createCar
    throw UnimplementedError();
  }
}

class HttpCarRepository implements CarRepository {
  final client = http.Client();
  final List<Car> cars = [];

  final String baseUrl = "";

  @override
  Future<List<Car>> fetchCars() async {
    if (cars.isEmpty) {
      try {
        var result = await http.get(Uri.parse('https://assignment-cars-api.herokuapp.com/api/cars'));
        if (result.statusCode != 200) {
          throw new Exception(
              "Response status code is not 200 check connection");
        }

        final json = jsonDecode(result.body);
        (json['results'] as List).forEach((element) {
          cars.add(Car.fromJson(element));
        });
      } catch (error) {
        print(error);
      }
    }

    return cars;
  }

  @override
  Future<Car> createCar() {
    // TODO: implement createCar
    throw UnimplementedError();
  }
}

class SqlCarRepository implements CarRepository {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Future<List<Car>> fetchCars() async {
    List<Car> cars = [];
    
    var allRows = await databaseHelper.queryAllRows();

    (allRows as List).forEach((element) {
      cars.add(Car.fromJson(element));
    });

    return cars;
  }

  @override
  Future<Car> createCar() {
    // TODO: implement createCar
    throw UnimplementedError();
  }
}

class NetworkError extends Error {}
