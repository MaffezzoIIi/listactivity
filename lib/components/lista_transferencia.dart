import 'package:flutter/material.dart';
import 'package:list_app/components/item_transferencia.dart';
import 'package:list_app/pages/formulario_transferencias.dart';

class ListaTransferencia extends StatefulWidget {
  ListaTransferencia({super.key});

  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTrasnferenciaState();
  }
}

class ListaTrasnferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencias'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTransferencias(),
            ),
          );
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}
