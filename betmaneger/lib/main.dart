import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() => ListaTransferenciaState();
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transferência'),
        ),
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, index) {
            final transfer = widget._transferencias[index];
            return ItemTransferencia(transfer);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future<Transferencia> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormTransferencia();
            }));

            future.then((transferenciaRecebida) {
              setState(() {widget._transferencias.add(transferenciaRecebida);});
            });
            },
        ));
  }
}

class FormTransferencia extends StatelessWidget {
  final TextEditingController _controlerValue = TextEditingController();
  final TextEditingController _controlerCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
              controler: _controlerCount,
              dica: '000',
              rotulo: 'Número da conta',
              icon: Icons.person),
          Editor(
              controler: _controlerValue,
              dica: '0.00',
              rotulo: 'Valor',
              icon: Icons.monetization_on),
          RaisedButton(
            onPressed: () => executeTransferer(context),
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }

  void executeTransferer(BuildContext context) {
    final int count = int.tryParse(_controlerCount.text);
    final double value = double.tryParse(_controlerValue.text);

    if (count != null && value != null) {
      final createTransfer = Transferencia(value, count);
      debugPrint('$createTransfer');
      Navigator.pop(context, createTransfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controler;
  final String rotulo;
  final String dica;
  final IconData icon;

  const Editor({this.controler, this.rotulo, this.dica, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 5, 20.0, 5),
      child: TextField(
          controller: controler,
          style: TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
              labelText: rotulo,
              hintText: dica,
              icon: icon != null ? Icon(icon) : null),
          keyboardType: TextInputType.number),
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

  @override
  String toString() {
    return 'Tranferencia{valor: $valor, numero da conta: $numeroConta}';
  }
}
