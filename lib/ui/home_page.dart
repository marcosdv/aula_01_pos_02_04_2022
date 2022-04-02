import 'package:aula_01_pos/components/campo_texto.dart';
import 'package:aula_01_pos/ui/sobre_page.dart';
import 'package:flutter/material.dart';

import 'contato_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _etanolController = TextEditingController();
  final _gasolinaController = TextEditingController();

  void _calcularClique() {
    var valorEtanol = double.tryParse(_etanolController.text.replaceAll(',', '.')) ?? 0;
    var valorGasolina = double.tryParse(_gasolinaController.text.replaceAll(',', '.')) ?? 0;

    if (valorGasolina <= 0) {
      _mostrarMensagem('Digite o valor da gasolina');
      return;
    }
    if (valorEtanol <= 0) {
      _mostrarMensagem('Digite o valor do etanol');
      return;
    }

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

  void _abrirContato() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ContatoPage()
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
          IconButton(
            icon: const Icon(Icons.mail_outline),
            onPressed: _abrirContato,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _calcularClique,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Etanol x Gasolina'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              leading: Icon(Icons.calculate_outlined),
              trailing: Icon(Icons.skip_next),
              title: Text('Calcular'),
              onTap: _calcularClique,
            ),
            ListTile(
              leading: Icon(Icons.mail),
              trailing: Icon(Icons.skip_next),
              title: Text('Contato'),
              onTap: _abrirContato,
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              trailing: Icon(Icons.skip_next),
              title: Text('Sobre'),
              onTap: _abrirSobre,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CampoTexto(
            controller: _etanolController,
            texto: 'Valor do Etanol',
            top: 32,
            prefixo: 'R\$ ',
            teclado: TextInputType.number,
          ),
          CampoTexto(
            controller: _gasolinaController,
            texto: 'Valor da Gasolina',
            bottom: 32,
            prefixo: 'R\$ ',
            teclado: TextInputType.number,
          ),
        ],
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