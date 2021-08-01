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
  List searchResult = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Auta"),
      ),
      backgroundColor: blackColor,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              onSubmitted: _runFilter,
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
            ),
            Expanded(
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: searchResult.length > 0
                      ? searchResult.length
                      : _list.length,
                  itemBuilder: (BuildContext context, index) {
                    if (searchResult.length > 0) {
                      return buildCarCard(searchResult, index);
                    } else {
                      return buildCarCard(_list, index);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarCard(list, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Proizvodjac: ${list[index].carProducer}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Model: ${list[index].carModel}',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Boja: ${list[index].color}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Registarski broj: ${list[index].plateNumber}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  void _runFilter(String enteredKeyword) {
    var results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _list;
    } else {
      if (_options == SearchOptions.color) {
        results = _list
            .where((car) =>
                car.color.toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
      }
      if (_options == SearchOptions.model) {
        results = _list
            .where((car) => car.carModel
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      searchResult = results;
    });
  }
}
