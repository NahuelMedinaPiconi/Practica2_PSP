import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2/models/Persona.dart';

class PersonalPage extends StatefulWidget {
  //Haura de ser statefull ja que conté textfields, es a dir que haurem de veure els canvis a la pantalla mentres escrivim. 
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {

  late Persona profile;
  TextEditingController _inputDateController = new TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profile = ModalRoute.of(context)!.settings.arguments as Persona;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camps - Edit Profile"),
      ),
      body: _createForm(),
    );
  }

  Widget _createForm() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          _createNameInput(),
          Divider(),
          _crearInputApellit(),
          Divider(),
          _createEmailInput(),
          Divider(),
          _createPasswordInput(),
          Divider(),
          _createDateInput(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createCancelButton(),
                SizedBox(width: 20),
                _createSaveButton(context)
              ]
            ),
          )
        ],
      ),
    );
  }

  Widget _createNameInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      onChanged: (valor) {
        setState(() {
          profile.name = valor;
        });
      },
      decoration: InputDecoration(
        counter: Text("${profile.name.length}"),
        hintText: profile.name,
        labelText: "Name",
        suffixIcon: Icon(Icons.man),
        icon: Icon(Icons.account_circle, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  Widget _crearInputApellit() {
    return TextField(
      onChanged: (valor) {
        setState(() {
          profile.apellits = valor;
        });
      },
      decoration: InputDecoration(
        counter: Text("${profile.apellits.length}"),
        hintText: profile.apellits,
        labelText: "Last Name",
        suffixIcon: Icon(Icons.man_4),
        icon: Icon(Icons.account_tree, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  Widget _createEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (valor) {
        setState(() {
          profile.apellits = valor;
        });
      },
      decoration: InputDecoration(
        counter: Text("${profile.email.length}"),
        hintText: profile.email,
        labelText: "Email",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  Widget _createPasswordInput() {
    return TextField(
      obscureText: true,
      onChanged: (value) => setState(() => profile.password = value),
      decoration: InputDecoration(
        counter: Text("${profile.password.length}"),
        labelText: "Password",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  Widget _createDateInput() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _addDataPicker(context);
      },
      decoration: InputDecoration(
        labelText: "Birth date",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  void _addDataPicker (BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context,
      // locale: Locale("es", "ES"),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _inputDateController.text = picked.toIso8601String().split("T")[0];
        profile.birthDate = picked;
      });
    }
  }

  Widget _createSaveButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        if (profile.missSmth()) {
          _showAlert(context);
        } else {
          Navigator.pop(context, profile);
        }
      },
      child: Text("Save and return")
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("All fields must be filled"),
          actions: [
            TextButton(onPressed: ()=> Navigator.of(context).pop(), child: Text("Ok")),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
        );
      }
    );
  }

  Widget _createCancelButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Cancel")
    );
  }
}