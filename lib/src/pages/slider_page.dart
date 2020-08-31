import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 300.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCeckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
      activeColor: Colors.purple,
    );
  }

  Widget _crearCeckBox() {
    /*
    return Checkbox(
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
    */
    return CheckboxListTile(
      activeColor: Colors.purple,
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      image: NetworkImage(
          "https://24.media.tumblr.com/2fb3a63c61c1b85bc5e5f8a8a1766172/tumblr_myjo10YJJz1sgxh69o1_500.png"),
      placeholder: AssetImage("assets/jar-loading.gif"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      activeColor: Colors.purple,
      label: "Tamaño de la imagen",
      onChanged: (_bloquearCheck)
          ? null
          : (value) {
              setState(() {
                _valorSlider = value;
              });
            },
    );
  }
}
