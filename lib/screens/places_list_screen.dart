import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
              onPressed: (() {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              }),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<GreatPlaces>(
        child:
            const Center(child: Text('Got no places yet, start adding some!')),
        builder: (context, greatPlaces, ch) => greatPlaces.items.isEmpty
            ? ch!
            : ListView.builder(
                itemBuilder: ((context, i) => ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              FileImage(greatPlaces.items[i].image)),
                      title: Text(greatPlaces.items[i].title),
                      onTap: (() {}),
                    )),
                itemCount: greatPlaces.items.length,
              ),
      ),
    );
  }
}
