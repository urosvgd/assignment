import 'package:equatable/equatable.dart';

class DatabaseHelper extends Equatable {
  final String sId;
  final String carProducer;
  final String carModel;
  final String plateNumber;
  final String color;
  final int v;

  DatabaseHelper({
    required this.sId,
    required this.v,
    required this.carProducer,
    required this.carModel,
    required this.color,
    required this.plateNumber,
  });

  factory DatabaseHelper.fromJson(Map<String, dynamic> json) {
    return DatabaseHelper(
      sId: json['_id'] ?? '-1',
      carProducer: json['carProducer'] ?? '-2',
      carModel: json['carModel'] ?? '-3',
      color: json['color'] ?? '-4',
      plateNumber: json['plateNumber'] ?? '-5',
      v: json['__v'] ?? -999,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carProducer'] = this.carProducer;
    data['carModel'] = this.carModel;
    data['color'] = this.color;
    data['plateNumber'] = this.plateNumber;
    data['__v'] = this.v;

    return data;
  }

  @override
  List<Object> get props => [
        sId,
        carProducer,
        carModel,
        color,
        plateNumber,
        v,
      ];

  // @override
  // String toString() {
  //   return 'id: $sId, car producer: $carProducer, car model: $carModel, color: $color, plate number: $plateNumber, v: $v';
  // }
}
