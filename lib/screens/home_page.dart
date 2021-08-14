import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moja_garaza/repository/cars_repository.dart';
import 'package:moja_garaza/widgets/car_numbers.dart';
import 'package:moja_garaza/widgets/custom_button.dart';
import 'package:moja_garaza/widgets/user_info.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int carNumber = 0;

  @override
  Widget build(BuildContext context) {
    FakeCarRepository().fetchCars().then((value) => setState(() {
          carNumber = value.length;
        }));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserInfo(
                imagePath: ("assets/images/user_icon.png"),
                onClicked: () async {},
              ),
              buildName("Uros", "Jovicic"),
              SizedBox(height: 24),
              CarNumbers(carNumbers: carNumber),
              Divider(
                height: 50,
                thickness: 3,
              ),
              SizedBox(height: 48),
              buildAbout("Brace Ribnikar", "Brace Ribnikar"),
              Divider(
                height: 150,
              ),
              navigateToGarage(context)
            ],
          ),
        ],
      ),
    );
  }

  Widget buildName(firstName, lastName) => Column(
        children: [
          Text(
            "Ime: $firstName",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 4),
          Text(
            "Prezime: $lastName",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )
        ],
      );

  Widget buildAbout(address, garageAddress) => Container(
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.garage_sharp),
                Text(
                  'Adresa garaze: $garageAddress',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.house_sharp),
                Text(
                  "Adresa stanovanja: $address",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  softWrap: false,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );

  Widget navigateToGarage(context) {
    return Expanded(
      flex: 0,
      child: Container(
        width: 350,
        height: 50,
        child: CustomButton(
          onPressed: () => Navigator.of(context).pushNamed('/garage'),
          buttonText: "Idi u garazu",
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textColor: Colors.black,
        ),
      ),
    );
  }
}
