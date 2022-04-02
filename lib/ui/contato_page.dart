import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../components/campo_texto.dart';

class ContatoPage extends StatelessWidget {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _mensagemController = TextEditingController();

  ContatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CampoTexto(controller: _nomeController, texto: 'Digite seu nome'),
          CampoTexto(
            controller: _emailController,
            texto: 'Digite seu e-mail',
            prefixo: '@ ',
            teclado: TextInputType.emailAddress,
          ),
          CampoTexto(controller: _mensagemController, texto: 'Digite sua mensagem'),

          ElevatedButton(
            child: Text('Enviar'),
            onPressed: _enviarEmail,
          ),
        ],
      ),
    );
  }

  void _enviarEmail() {
    const usuario = 'marcosvendramini@gmail.com';
    const senha = 'ainda_sem_senha';

    final smtpServer = gmail(usuario, senha);

    final mensagem = Message()
      ..from = const Address(usuario, 'Contato')
      ..recipients.add(usuario)
      ..subject = 'Contato via App'
      ..text = '''
        Nome: ${_nomeController.text}.<br />
        E-mail: ${_emailController.text}.<br />
        Mensagem: ${_mensagemController.text}.''';

    send(mensagem, smtpServer);
  }
}
