import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: FormTransferencia(),
    appBar: AppBar(
      title: Text('Transferência'),),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
  ),
));

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(300, 1000)),
        ItemTransferencia(Transferencia(300, 1000)),
        ItemTransferencia(Transferencia(300, 1000)),
        ],
    );
  }
}

class FormTransferencia extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return 
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
      )
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}