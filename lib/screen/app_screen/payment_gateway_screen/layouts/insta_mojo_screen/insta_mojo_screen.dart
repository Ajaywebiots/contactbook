import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/payment_gateway_provider/insta_mojo_provider.dart';
import 'insta_mojo.dart';

class InstaMojoScreen extends StatefulWidget {
  const InstaMojoScreen({super.key});

  @override
  _InstaMojoScreenState createState() => _InstaMojoScreenState();
}

class _InstaMojoScreenState extends State<InstaMojoScreen> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<InstaMojoProvider>(builder: (context, instaMojoPvr, child) {
      return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: TextFormField(
                controller: instaMojoPvr.amount,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(hintText: "Amount"),
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Amount is required")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InstaMojo()));
            },
            child: const Text("InstaMOJO"))
      ]));
    });
  }
}
