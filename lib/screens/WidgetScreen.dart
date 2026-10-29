import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  //La panatlla ha de ser statefull ja que utilitzam distints tipus d'animacions i canvis (con l'animated container)
  const WidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets page"),
      ),
      body: _crearExpansionTile(),
    );
  }

  Widget _crearExpansionTile() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      children: [
        ExpansionTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text('Primer Widget: ExpansionTile'),
          subtitle: Text('Fes clic pel segon widget'),
          collapsedBackgroundColor: Colors.blueGrey,
          backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          expansionAnimationStyle: AnimationStyle(
            duration: Duration(milliseconds: 600),
            reverseDuration: Duration(milliseconds: 400),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text("ExpansionTile permet desplegar un widget dintre d'un altre."),
                  _crearInteractiveViwer()
                ],
              ),  
            ),
          ],
        ),
      ],
    );
  }

  Widget _crearInteractiveViwer() {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 4.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhddvzkL8QugCtRugGj6Gs3tETMcxuHqN15q0QL3KvuckNILeDCBBxDtA&s=10",
            fit: BoxFit.cover
          ),
        )
      ),
    );
  }
}