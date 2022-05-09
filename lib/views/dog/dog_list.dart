import 'package:flutter/material.dart';

class DogListView extends StatefulWidget {
  const DogListView({Key? key}) : super(key: key);

  @override
  State<DogListView> createState() => _DogListViewState();
}

class _DogListViewState extends State<DogListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dogs"),
        backgroundColor: Colors.pink.shade100,
      ),
    );
  }
}
