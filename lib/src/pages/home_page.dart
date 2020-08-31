import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_providers.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: geticon(element['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.purple,
        ),
        onTap: () {
          /*
          final route = MaterialPageRoute(
            builder: (context) {
              return AlertPage();
            },
          );

          Navigator.push(context, route);
          */

          Navigator.pushNamed(context, element['ruta']);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
