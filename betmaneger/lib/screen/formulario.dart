import 'package:betmaneger/components/model.dart';
import 'package:betmaneger/model/transferencia.dart';
import 'package:flutter/material.dart';

class FormTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTransferenciaState();
  }
}

class FormTransferenciaState extends State<FormTransferencia> {
  final TextEditingController _controlerValue = TextEditingController();
  final TextEditingController _controlerCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ),
          ],
        ),
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
