import 'package:flutter/material.dart';
import 'package:great_place/providers/great_places.dart';
import 'package:great_place/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text('Nenhum local cadastrado'),
                ),
                builder: (context, greatePlaces, child) =>
                    greatePlaces.itemsCount == 0
                        ? child!
                        : ListView.builder(
                            itemCount: greatePlaces.itemsCount,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                    greatePlaces.itemByIndex(index).image),
                              ),
                              title:
                                  Text(greatePlaces.itemByIndex(index).title),
                              onTap: () {},
                            ),
                          ),
              ),
      ),
    );
  }
}
