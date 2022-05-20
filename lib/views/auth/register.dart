import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/models/user.dart';
import 'package:wikipets/service/auth_service.dart';
import 'package:wikipets/service/user_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmarSenha = TextEditingController();
  final nome = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(top: 60, right: 40, left: 40),
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
                controller: nome,
                decoration: InputDecoration(
                  labelText: "Nome",
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o nome";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o e-mail";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe a senha";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: confirmarSenha,
                decoration: InputDecoration(
                  labelText: "Confirm password",
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe a senha novamente";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (senha.text == confirmarSenha.text) {
                        registrar();
                      } else {
                        Get.snackbar(
                          "Erro",
                          "Falha ao criar usuário. As senhas são diferentes!",
                          backgroundColor: color1,
                          snackPosition: SnackPosition.TOP,
                        );
                      }
                    }
                  },
                  child: Text("Register"),
                ),
              ),
              SizedBox(
                height: 15,
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
      ),
    );
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
      User user = User(email.text, senha.text, nome.text);
      UserService().createUser(user);
      Get.back();
    } on AuthException catch (e) {
      Get.snackbar(
        "Erro!",
        e.message,
        backgroundColor: color1,
        snackPosition: SnackPosition.TOP,
      );
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Erro!",
        e.message.toString(),
        backgroundColor: color1,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
