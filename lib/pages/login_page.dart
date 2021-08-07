import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonChanged = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonChanged = true;
      });

      await Future.delayed(Duration(milliseconds: 300));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        buttonChanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          fontSize: 45,
                          fontFamily: GoogleFonts.pacifico().fontFamily,
                        )),
                    TextSpan(
                        text: '$name',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: GoogleFonts.merienda().fontFamily,
                        )),
                  ],
                ),
              ),
              // Text(
              //   "Welcome",
              //   style: TextStyle(
              //     fontSize: 45,
              //     fontFamily: GoogleFonts.pacifico().fontFamily,
              //   ),
              // ),
              // Text("asdads"),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.1),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        name = value.length == 0 ? value : ', $value';
                        setState(() {});
                      },
                      scrollPadding: EdgeInsets.only(bottom: 300),
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      scrollPadding: EdgeInsets.only(bottom: 130),
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length must be greater than 6";
                        } else
                          return null;
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Material(
                          borderRadius: buttonChanged
                              ? BorderRadius.circular(50)
                              : BorderRadius.circular(10),
                          color: Colors.deepPurple,
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: buttonChanged ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: buttonChanged
                                  ? Icon(Icons.done, color: Colors.white)
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
