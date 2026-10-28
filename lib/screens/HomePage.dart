import 'package:flutter/material.dart';
import 'package:practica2/models/Persona.dart';

class HomePage extends StatefulWidget {

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
      body: _createCard(context)
    );
  }

  Widget _createCard(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.man, color: Colors.orange, size: 30,),
                    SizedBox(width: 10),
                    Text("${_profile.name} ${_profile.apellits}"),
                    SizedBox(width: 100,),
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
              children: [
                ElevatedButton(
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
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, "/widgets"),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Explore Widget Showcase"),
                  )
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}