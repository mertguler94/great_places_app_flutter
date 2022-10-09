import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../providers/great_places.dart';
import '../widgets/location_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _form = GlobalKey<FormState>();
  late File _pickedImage;
  var _placeTitle;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) return;
    _form.currentState?.save();

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_placeTitle, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a New Place')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Title'),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value.';
                          }
                          if (_pickedImage == null) {
                            return 'Please provide an image.';
                          }
                          return null;
                        },
                        onSaved: ((value) {
                          _placeTitle = value;
                        }),
                      ),
                      const SizedBox(height: 10),
                      ImageInput(_selectImage),
                      const SizedBox(height: 10),
                      LocationInput(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: (() {
              _savePlace();
            }),
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.secondary),
                foregroundColor: MaterialStatePropertyAll(
                    Theme.of(context).buttonTheme.colorScheme?.onSecondary)),
          ),
        ],
      ),
    );
  }
}
