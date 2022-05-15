import 'package:flutter/material.dart';
import 'package:wikipets/constantes.dart';

class ForumAdd extends StatefulWidget {
  const ForumAdd({Key? key}) : super(key: key);

  @override
  _ForumAddState createState() => _ForumAddState();
}

class _ForumAddState extends State<ForumAdd> {
  final subject = TextEditingController();
  final description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color2,
        title: Text("Register  question"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15,left: 20,right: 20),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Subject"),
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.all(
                    new Radius.circular(10.0),
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                label: Text("Description"),
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.all(
                    new Radius.circular(10.0),
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 40, left: 40),
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                child: Text("Save"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
