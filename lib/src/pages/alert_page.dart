import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar Alerta"),
          color: Colors.purple,
          onPressed: () => _mostarAlerta(context),
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(/*"Contenido de la Alerta"*/ ""),
                FlutterLogo(
                  size: 100.00,
                  colors: Colors.purple,
                )
              ],
            ),
            actions: [
              FlatButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text(
                  "Aceptar",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
