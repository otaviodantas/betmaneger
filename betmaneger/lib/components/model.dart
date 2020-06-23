import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controler;
  final String rotulo;
  final String dica;
  final IconData icon;

  const Editor({
    this.controler,
    this.rotulo,
    this.dica,
    this.icon,
  });

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
