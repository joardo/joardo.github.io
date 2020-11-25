import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage(BuildContext context);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // String _uso = 'Interior';
  // String _tipoDeLuminaria = 'Campana';
  // String _descripcion = "Campana Colgante 1-250";
  // String _cantidadDeLuminarias = 'inicial';
  // int _horasPrendidas = 1;
  // int _diasActivos = 1;
  // double _costo = 2.2;

  double _valorSlider = 1.0;
  String _nombre = "";
  // String _email = "";
  // String _password = "";
  // String _fecha = "";
  String _opcionSeleccionada = "Interior";
  String _tipoSeleccionado = 'Estacionamiento';
  String _luminariaSeleccionada = 'Reflector 1-250W';
  // TextEditingController _inputFieldDateController = TextEditingController();
  List<String> _poderes = [
    'Interior',
    'Exterior',
  ];
  List<String> _tipos = [
    'Reflector',
    'Estacionamiento',
    'Alumbrado',
    'Fachada'
  ];

  List<String> _luminarias = [
    'Reflector 1-250W',
    'Reflector 1-400W',
    'Reflector 1-1000W',
    'Estacionamiento 1-175W',
    'Estacionamiento 1-250W',
    'Estacionamiento 1-400W',
    'Alumbrado en muro 1-70W',
    'Alumbrado en muro 1-175W',
    'Alumbrado en muro 1-250W',
    'Alumbrado en muro 1-400W',
    'Fachada 1-250W',
    'Fachada 1-400W',
    'Fachada 1-1000W',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: <Widget>[
        Wrap(
          children: [
            _crearDropdown(),
            Divider(),
            _crearDropdown2(),
            Divider(),
            // _cantidadLuminariasInput(),
            // Divider(),
            _crearSlider(),
            Divider(),
          ],
        )
      ],
    );
  }

  Widget crearInput() {
    return TextField(
      //   autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_nombre.length}"),
          hintText: "Nombre de la persona",
          labelText: "Nombre",
          helperText: "Sólo es el helper text",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  // Widget _crearEmail() {
  //   return TextField(
  //     keyboardType: TextInputType.emailAddress,
  //     //   autofocus: true,
  //     textCapitalization: TextCapitalization.sentences,
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  //         hintText: "Email",
  //         labelText: "Email",
  //         suffixIcon: Icon(Icons.alternate_email),
  //         icon: Icon(Icons.email)),
  //     onChanged: (valor) {
  //       setState(() {
  //         _email = valor;
  //       });
  //     },
  //   );
  // }

  // Widget _crearPassword() {
  //   return TextField(
  //     obscureText: true,
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  //         hintText: "Password",
  //         labelText: "Password",
  //         suffixIcon: Icon(Icons.lock_open),
  //         icon: Icon(Icons.lock)),
  //     onChanged: (valor) {
  //       setState(() {
  //         _password = valor;
  //       });
  //     },
  //   );
  // }

  // Widget _crearFecha(BuildContext context) {
  //   return TextField(
  //     enableInteractiveSelection: false,
  //     controller: _inputFieldDateController,
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  //         hintText: "Fecha de nacimiento",
  //         labelText: "Fecha de nacimiento",
  //         suffixIcon: Icon(Icons.calendar_today),
  //         icon: Icon(Icons.calendar_view_day)),
  //     onTap: () {
  //       FocusScope.of(context).requestFocus(new FocusNode());
  //       _selectDate(context);
  //     },
  //   );
  // }

  // _selectDate(BuildContext context) async {
  //   DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2045),
  //       locale: Locale("es", "MX"));

  //   if (picked != null) {
  //     setState(() {
  //       _fecha = picked.toString();
  //       _inputFieldDateController.text = _fecha;
  //     });
  //   }
  // }

  List<DropdownMenuItem<String>> getOpcionesDropdown(List<String> items) {
    List<DropdownMenuItem<String>> lista = List();
    items.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Wrap(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Text('Uso:'),
        SizedBox(width: 10.0),
        DropdownButton(
          hint: Text('Uso'),
          value: _opcionSeleccionada,
          underline: Container(height: 2, color: Colors.yellow),
          items: getOpcionesDropdown(_poderes),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        ),
        VerticalDivider(),
        Text('Tipo de Luminaria:'),
        SizedBox(width: 10.0),
        Container(
          child: DropdownButton(
            hint: Text('Tipo de Luminaria'),
            value: _tipoSeleccionado,
            underline: Container(height: 2, color: Colors.yellow),
            items: getOpcionesDropdown(_tipos),
            onChanged: (opt) {
              setState(() {
                _tipoSeleccionado = opt;
              });
            },
          ),
        ),
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Text('Descripción Luminaria:'),
        SizedBox(width: 10.0),
        Container(
          child: DropdownButton(
            hint: Text('Luminaria'),
            value: _luminariaSeleccionada,
            underline: Container(height: 2, color: Colors.yellow),
            items: getOpcionesDropdown(_luminarias),
            onChanged: (opt) {
              setState(() {
                _luminariaSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }

  // Widget _crearPersona() {
  //   return ListTile(
  //     title: Text('Nombre es $_nombre'),
  //     subtitle: Text('Correo es $_email'),
  //     trailing: Text(_opcionSeleccionada),
  //     leading: Text(_password),
  //   );
  // }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.grey,
        label: _valorSlider.round().toString(),
        // divisions: 20,
        value: _valorSlider,
        min: 0.0,
        max: 4000.0,
        onChanged: ((double valor) {
          setState(() {
            _valorSlider = valor;
          });
        }));
  }

  Widget _crearDropdown2() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Text('Descripción Luminaria:'),
        SizedBox(width: 10.0),
        Container(
          child: DropdownButton(
            hint: Text('Luminaria'),
            value: _luminariaSeleccionada,
            underline: Container(height: 2, color: Colors.yellow),
            items: getOpcionesDropdown(_luminarias),
            onChanged: (opt) {
              setState(() {
                _luminariaSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }

  // Widget _cantidadLuminariasInput() {
  //   return TextField(
  //     keyboardType: TextInputType.number,

  //     //   autofocus: true,
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  //         hintText: "Cantidad de Luminarias",
  //         labelText: "Cantidad de Luminarias",
  //         suffixIcon: Icon(Icons.lightbulb),
  //         icon: Icon(Icons.lightbulb_outlined)),
  //     onChanged: (valor) {
  //       setState(() {
  //         _cantidadDeLuminarias = valor;
  //       });
  //     },
  //   );
  // }
}
