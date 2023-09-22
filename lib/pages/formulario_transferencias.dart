import 'package:flutter/material.dart';
import 'package:list_app/components/editor.dart';
import 'package:list_app/components/item_transferencia.dart';

class FormularioTransferencias extends StatefulWidget {
  FormularioTransferencias({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencias> {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferencia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: _controllerCampoNumeroConta,
                labelText: 'Numero da conta',
                hintText: '0000',
                icon: const IconData(0)),
            Editor(
                controller: _controllerCampoValor,
                labelText: 'Valor',
                hintText: '0.00',
                icon: Icons.monetization_on),
            ElevatedButton(
                onPressed: () {
                  _criaTransferencia(context);
                },
                child: const Text('Confirmar')),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(_controllerCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
