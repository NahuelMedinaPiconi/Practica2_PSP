import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WidgetSlidable extends StatefulWidget {
  //És statefull ja que, per eliminar el primer widget slidable hem de fer un setState.
  const WidgetSlidable({super.key});

  @override
  State<WidgetSlidable> createState() => _WidgetSlidableState();
}

class _WidgetSlidableState extends State<WidgetSlidable> {
  bool _primeroVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget extra ocult: Slidable"),
      ),
      body: SlidableAutoCloseBehavior(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text("Slidable bàsic", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 15)),
              if (_primeroVisible) _crearBasic(),
              Text("Slidable unilateral, i + funcions", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 15),),
              _crearUnilateral(),
              Text("Slidable diferents a cada costat", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 15),),
              _crearAmplades(),
              Text("Slidable amb animació d'estirar", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 15),),
              _crearEstirar(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearBasic() {
    return Slidable(
      key: const ValueKey('primero'),
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            setState(() => _primeroVisible = false);
          },
        ),
        children: [
          SlidableAction(
            onPressed: (_) {
              setState(() => _primeroVisible = false);

            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Eliminar',
          ),
        ],
      ),
      child: const ListTile(
        title: Text("Slidable 1"),
        subtitle: Text("Proba a arrastrar cap a la dreta del tot"),
        leading: Icon(Icons.swap_horiz),
      ),
    );
  }

  Widget _crearUnilateral() {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_){},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.share,
          ),
          SlidableAction(
            onPressed: (_){},
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.bookmark,
          ),
          SlidableAction(
            onPressed: (_){},
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.more_horiz,
          ),
        ],
      ),
      child: const ListTile(
        title: Text("Slidable 2"),
        subtitle: Text("Cap a l'esquerra, tenim 3 opcions."),
        leading: Icon(Icons.menu_open),
      ),
    );
  }

  Widget _crearAmplades() {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (_){},
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            icon: Icons.favorite,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.6,
        children: [
          SlidableAction(
            onPressed: (_){},
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
            icon: Icons.call,
          ),
          SlidableAction(
            onPressed: (_){},
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            icon: Icons.sms,
          ),
        ],
      ),
      child: const ListTile(
        title: Text("Slidable 3"),
        subtitle: Text('Cap els dos costats amb amples diferents'),
        leading: Icon(Icons.layers),
      ),
    );
  }

  Widget _crearEstirar() {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (_){},
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
          SlidableAction(
            flex: 1,
            onPressed: (_){},
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: const ListTile(
        title: Text('Slidable 4'),
        subtitle: Text("Cap a l'esquerra, s'estiren els elements"),
        leading: Icon(Icons.open_in_full),
      ),
    );
  }
}