import 'package:bitebank/components/editor.dart';
import 'package:bitebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoValor = '0.00';
const _dicaCampoNumeroConta = '00001';
const _textConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(_controladorCampoNumeroConta, _rotuloCampoNumeroConta, _dicaCampoNumeroConta),
            Editor(_controladorCampoValor, _rotuloCampoValor, _dicaCampoValor,
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text(_textConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != '' && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
