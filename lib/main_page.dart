import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moja_garaza/models/car.dart' as car;
import 'package:moja_garaza/theme.dart';
import 'package:moja_garaza/widgets/custom_button.dart';

class MainPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    print(car.cars[0]);
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(50),
              color: greyColor2,
              child: Column(
                children: [
                  Text(
                    "Noob",
                    style: TextStyle(color: blackColor),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
            navigateToGarage(context),
          ],
        ),
      ),
    );
  }

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
