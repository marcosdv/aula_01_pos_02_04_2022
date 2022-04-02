import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var etanolController = TextEditingController();
  var gasolinaController = TextEditingController();
  var resultado = '';

  void calcularClique() {
    var valorEtanol = double.parse(etanolController.text);
    var valorGasolina = double.parse(gasolinaController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      resultado = 'Etanol';
    } else {
      resultado = 'Gasolina';
    }

    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 40),
            Text('Etanol x Gasolina', style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: calcularClique,
      ),
      body: Column(
        children: [
          //Text('Valor do Etanol:', style: TextStyle(fontSize: 30),),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
            child: TextField(
              controller: etanolController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor do Etanol',
                labelStyle: TextStyle(fontSize: 28),
                prefixText: 'R\$ ',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: gasolinaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor da Gasolina',
                labelStyle: TextStyle(fontSize: 28),
                prefixText: 'R\$ ',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Text('Abasteça com ${resultado.toUpperCase()}', style: TextStyle(fontSize: 24),),
        ],
      ),
    );
  }
}