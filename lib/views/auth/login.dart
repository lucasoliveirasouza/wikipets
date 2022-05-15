import 'package:flutter/material.dart';
import 'package:wikipets/constantes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 120, right: 40, left: 40),
        child: ListView(
          children: [
            Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset("assets/images/cat.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Wikipets",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: color3),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
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
              height: 25,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
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
              height: 25,
            ),
            Container(
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Register now"),
            ),
          ],
        ),
      ),
    );
  }
}
