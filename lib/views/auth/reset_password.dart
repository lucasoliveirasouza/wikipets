import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/service/auth_service.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 120, right: 40, left: 40),
        child: ListView(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset("assets/images/cat.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Redefinir Senha",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: color3,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Informe o e-mail para o qual deseja redefinir a sua senha.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: color3,
                ),
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
              height: 20,
            ),
            Container(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  resetar();
                  Get.back();
                },
                child: Text("Redefinir senha"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  resetar() async {
    try {
      await context.read<AuthService>().resetPassword(email.text);
      print("Entrei");
    } on AuthException catch (e) {
      Get.snackbar(
        "Erro",
        e.message,
        backgroundColor: color1,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
