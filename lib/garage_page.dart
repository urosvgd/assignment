// import 'package:moja_garaza/detail_page.dart';
import 'package:moja_garaza/detail_page.dart';
import 'package:moja_garaza/theme.dart';
import 'package:flutter/material.dart';

import 'models/car.dart' as car;
import 'models/car.dart';

enum SearchOptions { model, color }

class GaragePage extends StatefulWidget {
  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  SearchOptions? _options = SearchOptions.model;

  Icon icon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  late List<Car> _list;
  late bool _isSearching;
  String _searchText = "";
  List searchresult = [];

  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }

  void values() {
    _list = car.cars;
  }

  @override
  Widget build(BuildContext context) {
    print(searchresult);
    return Scaffold(
      appBar: AppBar(
        title: Text("Auta"),
      ),
      backgroundColor: blackColor,
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                onSubmitted: searchOperation,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: const Text('Model'),
                    leading: Radio<SearchOptions>(
                      value: SearchOptions.model,
                      groupValue: _options,
                      onChanged: (SearchOptions? value) {
                        setState(() {
                          _options = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Color'),
                    leading: Radio<SearchOptions>(
                      value: SearchOptions.color,
                      groupValue: _options,
                      onChanged: (SearchOptions? value) {
                        setState(() {
                          _options = value;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 31, bottom: 21, top: 20),
                  child: Text(
                    'Vasa vozila',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(),
                      ),
                    );
                  },
                  child: Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, index) {
                            return buildCarCard(_list, index);
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarCard(carList, int index) {
    return Card(
      child: Container(
        height: 100,
        color: blackColor,
        child: Row(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.car_rental_rounded),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListTile(
                        isThreeLine: true,
                        title:
                            Text("Proizvodnja: ${carList[index].carProducer}"),
                        subtitle: Text("Model ${carList[index].carModel}"),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Boja: ${carList[index].color}"),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Reg.Br.: ${carList[index].plateNumber}"),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex: 8,
            ),
          ],
        ),
      ),
      elevation: 8,
      margin: EdgeInsets.all(10),
    );
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = Icon(
        Icons.search,
        color: Colors.white,
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    for (int i = 0; i < _list.length; i++) {
      if (_options == SearchOptions.model) {
        String data = _list[i].carModel;

        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }

      if (_options == SearchOptions.color) {
        String data = _list[i].color;

        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}
