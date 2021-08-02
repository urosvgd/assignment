import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_garaza/bloc/cars_bloc.dart';
import 'package:moja_garaza/services/car_services.dart';
import 'package:moja_garaza/theme.dart';
import 'package:flutter/material.dart';
import './repository/cars_repository.dart';

enum SearchOptions { model, color }

class GaragePage extends StatefulWidget {
  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  SearchOptions? _options = SearchOptions.model;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Garaza"),
      ),
      backgroundColor: blackColor,
      body: BlocProvider<CarsBloc>(
        create: (_) =>
            CarsBloc(CarService(FakeCarsRepository()))..add(GetCarsEvent()),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
          child: Container(
            child: BlocBuilder<CarsBloc, CarsState>(
              builder: (ctx, state) {
                if (state is CarsLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is CarsLoaded) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      searchField(ctx),
                      pickCategory(),
                      buildList(state.cars),
                    ],
                  );
                }
                if (state is CarsError) {
                  return Center(
                    child: Text(
                      "Nesto je poslo po zlu !!",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildList(List cars) {
    if (cars.length == 0) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Kola prema parametrima za pretragu nepostojeca",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: cars.length,
          itemBuilder: (BuildContext context, index) {
            if (cars.length > 0) {
              return buildCarCard(cars, index);
            }
            return Container();
          }),
    );
  }

  Column pickCategory() {
    return Column(
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
          title: const Text('Boja'),
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
    );
  }

  TextField searchField(BuildContext ctx) {
    return TextField(
      controller: _controller,
      onSubmitted: (value) {
        _submitSearch(ctx, value);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.white),
        hintText: "Pretraga...",
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: _controller.clear,
          icon: Icon(Icons.clear),
        ),
      ),
    );
  }

  Widget buildCarCard(list, index) {
    return Card(
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
  }

  void _submitSearch(BuildContext context, String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      context.read<CarsBloc>().add(GetCarsEvent());
    }
    if (_options == SearchOptions.model) {
      context.read<CarsBloc>().add(SearchCarsByModelEvent(enteredKeyword));
    } else {
      context.read<CarsBloc>().add(SearchCarsByColorEvent(enteredKeyword));
    }
  }
}
