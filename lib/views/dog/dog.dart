import 'package:flutter/material.dart';
import 'package:wikipets/models/dog_model.dart';

class DogView extends StatefulWidget {
  DogModel dog;
  DogView({Key? key, required this.dog}) : super(key: key);

  @override
  State<DogView> createState() => _DogViewState();
}

class _DogViewState extends State<DogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dog.name ?? ""),
      ),
    );
  }
}
