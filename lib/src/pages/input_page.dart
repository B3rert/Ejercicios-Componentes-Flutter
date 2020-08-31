import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  String _optSeleccionada = "Volar";

  List<String> _poderes = [
    "Volar",
    "Rayos X",
    "Super Aliento",
    "Super Fuerza",
  ];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 20.0,
        ),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getopcionesDropDown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.sort),
        SizedBox(
          width: 30.0,
        ),
        DropdownButton(
          value: _optSeleccionada,
          items: getopcionesDropDown(),
          onChanged: (opt) {
            setState(() {
              _optSeleccionada = opt;
            });
          },
        ),
      ],
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Fecha de  Nacimiento",
        labelText: "Fecha de Nacimiento:",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2050),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      _fecha = picked.toString();
      _inputFieldDateController.text = _fecha;
    }
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Password",
        labelText: "Password:",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Email",
        labelText: "Email:",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre: $_nombre"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_optSeleccionada),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text("Caracteres ${_nombre.length}"),
        hintText: "Nombre",
        labelText: "Nombre:",
        helperText: "Solo nombres",
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.person),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }
}
