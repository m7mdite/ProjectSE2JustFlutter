import 'package:flutter/material.dart';
import 'package:project/screens/homescreen.dart';

int? username;
String? pass;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> global = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "login",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: global,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: size.height * 0.15),
                const Center(
                  child: Text(
                    "WELCOME BACKE",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      wordSpacing: 2,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: size.height * 0.05),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blue, blurRadius: 5, spreadRadius: 5)
                      ]),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(height: size.height * 0.05),
                      const idfield(),
                      Container(height: size.height * 0.05),
                      const passfield(),
                      Container(height: size.height * 0.1),
                      TextButton(
                        onPressed: () {
                          if (global.currentState?.validate() ?? false) {
                            global.currentState?.save();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homescreen()));
                          }
                        },
                        child: const Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(-5, 5),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class passfield extends StatelessWidget {
  const passfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (val) {
        pass = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "): الباسوورد ضروري";
        }
        if (value.length < 5) {
          return "ضعيف جداً";
        }
        if (value.length >= 5 && value.length < 8) {
          return "ضعيف";
        }
        return null;
      },
      obscureText: true,
      obscuringCharacter: "*",
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1.5),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.5),
        ),
        labelText: "الرقم السري",
        icon: Icon(Icons.password),
        iconColor: Colors.blue,
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}

class idfield extends StatelessWidget {
  const idfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      onSaved: (val) {
        username = int.tryParse(val!);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "الرجاء ادخال الرقم";
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1.5),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.5),
        ),
        labelText: " رقمك الشخصي",
        icon: Icon(Icons.person),
        iconColor: Colors.blue,
      ),
    );
  }
}
