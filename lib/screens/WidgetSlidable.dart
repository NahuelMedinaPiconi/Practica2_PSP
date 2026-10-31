import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WidgetSlidable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget extra ocult: Slidable"),
      ),
      body: ListView(
        children: [
          Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: "Slidable necesita dependencies",
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // TODO
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Borrar',
                ),
              ],
            ),
            child: const ListTile(
              title: Text('Slidable: Widget 3'),
              subtitle: Text('Proba a moure aquest contenedor als costats.'),
              leading: Icon(Icons.swap_horiz),
            ),
          ),
        ],
      )
    );
  }
}