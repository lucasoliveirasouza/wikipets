import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/service/auth_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final email = TextEditingController();
  final senha = TextEditingController();
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
                child: Image.asset("assets/images/dog.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Register",
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: color3),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
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
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: senha,
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
                onPressed: () {
                  registrar();
                  Navigator.of(context).pop();
                },
                child: Text("Register"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
