import 'package:flutter/material.dart';
import 'package:project/screens/homescreen.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final GlobalKey<FormState> g = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: g,
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  counter: const Text(
                    "المدة",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.5)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(10)),
                  counter: const Text(
                    "سبب الإجازة",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.5)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  done = true;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homescreen()),
                  );
                },
                child: Container(
                  decoration:
                      const BoxDecoration(color: Colors.blue, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 3,
                    )
                  ]),
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 20,
                  ),
                  child: const Text(
                    "تأكيد",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
