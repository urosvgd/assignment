import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moja_garaza/widgets/custom_button.dart';
import 'package:moja_garaza/widgets/user_info.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adresa garaze: $garageAddress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "Adresa stanovanja: $address",
              style: TextStyle(fontSize: 16, height: 1.4),
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
