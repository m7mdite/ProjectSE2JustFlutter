import 'package:flutter/material.dart';

class stateRequest extends StatelessWidget {
  const stateRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.white,
            ),
          )),
          Center(
            child: Text(
              "... طلبك قيد المعالجة,الرجاء الانتظار",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
