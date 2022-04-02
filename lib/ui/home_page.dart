import 'dart:ui';

import 'package:aula_01_pos/ui/sobre_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _etanolController = TextEditingController();
  final _gasolinaController = TextEditingController();

  void _calcularClique() {
    var valorEtanol = double.parse(_etanolController.text);
    var valorGasolina = double.parse(_gasolinaController.text);

    if (valorEtanol <= (valorGasolina * 0.7)) {
      _mostrarMensagem('Abasteça com Etanol');
    } else {
      _mostrarMensagem('Abasteça com Gasolina');
    }
  }

  void _abrirSobre() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => SobrePage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 30),
            Text('Etanol x Gasolina', style: TextStyle(fontSize: 20),),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _abrirSobre,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _calcularClique,
      ),
      body: Column(
        children: [
          _criarCampoTexto(controller: _etanolController, texto: 'Valor do Etanol', top: 32),
          _criarCampoTexto(controller: _gasolinaController, texto: 'Valor da Gasolina', bottom: 32),
        ],
      ),
    );
  }

  Widget _criarCampoTexto({required TextEditingController controller,
    required String texto,
    double left = 16, double top = 16, double right = 16, double bottom = 16}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: texto,
          labelStyle: const TextStyle(fontSize: 28),
          prefixText: 'R\$ ',
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _mostrarMensagem(String texto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Etanol x Gasolina'),
          content: Text(texto),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () { Navigator.pop(context); },
            ),
          ],
        );
      }
    );
  }
}