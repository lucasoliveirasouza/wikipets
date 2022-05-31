import 'package:flutter/material.dart';
import 'package:wikipets/constantes.dart';

class CommentEditView extends StatefulWidget {
  const CommentEditView({Key? key}) : super(key: key);

  @override
  State<CommentEditView> createState() => _CommentEditViewState();
}

class _CommentEditViewState extends State<CommentEditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit comment"),
        backgroundColor: color2,
      ),
    );
  }
}
