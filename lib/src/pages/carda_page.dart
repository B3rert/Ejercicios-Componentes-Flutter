import 'dart:ui';

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
              image: NetworkImage(
                  "https://www.noticiasenserie.com/wp-content/uploads/2016/01/Studio-Gihbli.jpg"),
              placeholder: AssetImage("assets/jar-loading.gif"),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  "Era muy raro. En su estado normal de chica joven, Sophie habría temblado de vergüenza ante su comportamiento. En su estado de anciana, no le importaba lo que hacía o decía"))
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ],
        color: Colors.white,
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.purple,
            ),
            title: Text("Alerta"),
            subtitle: Text(
                "Está apunto de realizar una accion irreversible, ¿Desea continuar?"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  "Aceptar",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
