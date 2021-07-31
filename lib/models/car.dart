class Car {
  String carProducer;
  String carModel;
  String plateNumber;
  String color;
  Car({ 
    required this.carProducer, 
    required this.carModel, 
    required this.color, 
    required this.plateNumber
  });
}

List<Car> cars = [
  Car(carProducer: "BMW", carModel: "BMW", color: "Red", plateNumber: "BG 333 222"),
  Car(carProducer: "Audi", carModel: "Audi e-tron", color: "Green", plateNumber: "BG 333 222"),
  // Car(carProducer: "Bugatti", carModel: "16/4 Veyron Concept", color: "Blue", plateNumber: "BG 333 222"),
  // Car(carProducer: "Fiat", carModel: "500", color: "Grey", plateNumber: "BG 333 222"),
  // Car(carProducer: "Skoda", carModel: "Kushaq", color: "Purple", plateNumber: "BG 333 222"),
  // Car(carProducer: "Volvo", carModel: "xc90", color: "Pink", plateNumber: "BG 333 222"),
  // Car(carProducer: "Volga", carModel: "m24", color: "Black", plateNumber: "BG 333 222"),
  // Car(carProducer: "Tata", carModel: "Safari", color: "Red", plateNumber: "BG 333 222"),
  // Car(carProducer: "Toyota", carModel: "Avalon", color: "Blue", plateNumber: "BG 333 222"),
  // Car(carProducer: "Peugeot", carModel: "Sedan", color: "Red", plateNumber: "BG 333 222"),
  // Car(carProducer: "Audi", carModel: "A4", color: "Green", plateNumber: "BG 333 222"),
  // Car(carProducer: "Skoda", carModel: "Fabia", color: "Purple", plateNumber: "BG 333 222"),

];