import 'package:flutter/material.dart';
import 'package:practica2/models/Persona.dart';

class HomePage extends StatefulWidget {
  //Ha de ser stateful ja que, al retornar de la pagina d'editar, hem de canviar els valors de la persona amb un setState().

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona _profile = new Persona.nou();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DevProfile M3"),
      ),
      body: Align(alignment: Alignment.topCenter, child: _createCard(context))
    );
  }

  Widget _createCard(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Perfil profesional:", style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight(500)),),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${_profile.name} ${_profile.apellits}"),
                      Text(_profile.email)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_profile.adress),
                      Text(_profile.birthDate.toIso8601String().split("T")[0]),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _createEditButton(context),
                  _createWidgetsButton(context),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _createEditButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, "/edit", arguments: _profile)
      .then((value) {
        if (value != null) {
          setState(() {
            _profile = value as Persona;
          });
        }
      }),
      child: Text("Edit Profile")
    );
  }

  Widget _createWidgetsButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, "/widgets"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Explore Extra Widgets..."),
      )
    );
  }
}