import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormTransferencia(),
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferência'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(300, 1000)),
          ItemTransferencia(Transferencia(300, 1000)),
          ItemTransferencia(Transferencia(300, 1000)),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // )
    );
  }
}

BoxDecoration mydecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.red, //                   <--- border color
      width: 5.0,
    ),
  );
}

class FormTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
            child: TextField(
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    labelText: "Número da conta",
                    hintText: "000",
                    icon: Icon(Icons.person)),
                keyboardType: TextInputType.number),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
            child: TextField(
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    labelText: "Valor",
                    hintText: "0.00",
                    icon: Icon(Icons.monetization_on)),
                keyboardType: TextInputType.number),
          ),
          RaisedButton(
            child: Text('Confirmar'),
          )
        ],
      ),
    );
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
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
