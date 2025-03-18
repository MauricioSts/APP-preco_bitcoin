import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String bitecoValor = "0";

class _HomeState extends State<Home> {
  _valorBTC() async {
    String url = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);

    double brazilian = retorno["BRL"]["last"];

    setState(() {
      bitecoValor = brazilian.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/bitcoin.png"),
          SizedBox(height: 20),
          Text(
            "${bitecoValor} BRL",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              _valorBTC();
            },
            child: Text(
              "Atualizar",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
