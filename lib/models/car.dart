import 'package:equatable/equatable.dart';

class Car extends Equatable {
  String serialNumber;
  final String carProducer;
  final String carModel;
  final String plateNumber;
  final String color;
  final int v;

  Car({
    required this.serialNumber,
    required this.v,
    required this.carProducer,
    required this.carModel,
    required this.color,
    required this.plateNumber,
  });

  factory Car.fromJson(Map<String, dynamic> json, { bool changeId: true }) {
    return Car(
      serialNumber: json[changeId ? 'serialNumber' :'_id'] ?? '-1',
      carProducer: json['carProducer'] ?? '-2',
      carModel: json['carModel'] ?? '-3',
      color: json['color'] ?? '-4',
      plateNumber: json['plateNumber'] ?? '-5',
      v: json['__v'] ?? -999,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serialNumber'] = this.serialNumber;
    data['carProducer'] = this.carProducer;
    data['carModel'] = this.carModel;
    data['color'] = this.color;
    data['plateNumber'] = this.plateNumber;
    data['__v'] = this.v;

    return data;
  }

  @override
  List<Object> get props => [
        serialNumber,
        carProducer,
        carModel,
        color,
        plateNumber,
        v,
      ];

  @override
  String toString() {
    return 'id: $serialNumber, car producer: $carProducer, car model: $carModel, color: $color, plate number: $plateNumber, v: $v';
  }
}
