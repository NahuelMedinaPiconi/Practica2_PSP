import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  //Necesitam stateful per comprovar l'estat del trandormationController i enviar a l'usuari a altre pagina quan posi la imatge a la esquina
  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  //La panatlla ha de ser statefull ja que utilitzam distints tipus d'animacions i canvis (con l'animated container)
  final TransformationController _imgController = TransformationController();
  bool _imgInAction = false;

  @override
    void dispose() {
    _imgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets page"),
      ),
      body: _crearExpansionTile(context),
    );
  }

  Widget _crearExpansionTile(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      children: [
        ExpansionTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text('Primer Widget: ExpansionTile'),
          subtitle: Text('Fes clic pel segon widget'),

          collapsedBackgroundColor: Colors.blueGrey,
          backgroundColor: Colors.cyanAccent,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
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
                  Text("Segon Widget: InteractiveWidget. Proba a moure la imatge, ampliarla o ferla més petita"),
                  SizedBox(height: 10,),
                  _crearInteractiveViwer(context),
                  SizedBox(height: 10,),
                  Text("Fes una proba, posa la imatge abaix a la dreta...")
                ],
              ),  
            ),
          ],
        ),
      ],
    );
  }

  Widget _crearInteractiveViwer(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.lightBlue
      ),
      child: InteractiveViewer(
        transformationController: _imgController,
        boundaryMargin: EdgeInsets.all(100),
        onInteractionEnd: (_) => _checkImgPosition(context),
        minScale: 0.8,
        maxScale: 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhddvzkL8QugCtRugGj6Gs3tETMcxuHqN15q0QL3KvuckNILeDCBBxDtA&s=10",
            fit: BoxFit.cover
          ),
        )
      ),
    );
  }

  void _checkImgPosition(BuildContext context) async {
    if (_imgInAction) return;

    final translation = _imgController.value.getTranslation();

    if (translation.x > 70 && translation.y > 70) {
      _imgInAction = true;

      await Navigator.pushNamed(context, "/slidable");
      _imgController.value = Matrix4.identity();
      _imgInAction = false;
    }
  }
}