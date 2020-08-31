import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarImagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregarImagenes();
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _crearLista() {
    return RefreshIndicator(
      color: Colors.purple,
      onRefresh: _obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          int image = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage("https://picsum.photos/500/350/?image=$image"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        },
      ),
    );
  }

  Future<Null> _obtenerPagina() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarImagenes();
    });

    return Future.delayed(duration);
  }

  void _agregarImagenes() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);

    new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _agregarImagenes();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
