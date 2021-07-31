// import 'package:moja_garaza/detail_page.dart';
import 'package:moja_garaza/theme.dart';
import 'package:flutter/material.dart';

import 'models/car.dart' as car;
import 'models/car.dart';

class GaragePage extends StatefulWidget {
  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  Widget appBarTitle = new Text(
    "Search Example",
    style: TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: buildAppBar(context)),
      backgroundColor: blackColor,
      body: ListView(
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailPage(),
              //   ),
              // );
            },
            child: Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, index) {
                      return buildCarsList();
                      // return Text(_list[index].carModel);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarsList() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[Text('Hello World'), Text('How are you?')],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _controller,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    for (int i = 0; i < _list.length; i++) {
      String data = _list[i].carModel;
      if (data.toLowerCase().contains(searchText.toLowerCase())) {
        searchresult.add(data);
      }
    }
  }
}
