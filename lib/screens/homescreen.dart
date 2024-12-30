import 'package:flutter/material.dart';
import 'package:project/screens/request.dart';

bool done = false;
Color requestc = Colors.blue;
Color statec = Colors.grey;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Licencing",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black, blurRadius: 10)],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (done == false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Request()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: done ? Colors.grey : Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Text(
                  "طلب إجازة",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                if (done) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Scaffold(
                          body: Center(
                            child: Text(
                              "... طلبك قيد المعالجة,الرجاء الانتظار",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ));
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    color: done ? Colors.blue : Colors.grey,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 10,
                      )
                    ]),
                child: const Text(
                  "حالة الطلب",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
            ),
            InkWell(
              onTap: () {
                if (done) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("تأكيد الإلغاء"),
                        content:
                            const Text('هل أنت متأكد أنك تريد إلغاء الطلب؟'),
                        actions: [
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    done = false;
                                    setState(() {});
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("نعم")),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("لا"),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: done ? Colors.red : Colors.grey,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: const Text(
                  "إلغاء الطلب",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
