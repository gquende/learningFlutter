import 'package:flutter/material.dart';
import 'package:learn/models/item.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];

    items.add(Item(title: "Item 1", done: false));
    items.add(Item(title: "Item 2", done: true));
    items.add(Item(title: "Item 3", done: false));
    items.add(Item(title: "Item 4", done: true));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controladorEntrada =
      new TextEditingController(); //Classe que cria um controlador para insercao de txto

//Todo metodo que altera uma coisa na tela deve conter o setState
  void add() {
    if (controladorEntrada.text.isEmpty) return;

    setState(() {
      widget.items.add(Item(title: controladorEntrada.text, done: false));
      controladorEntrada.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    controladorEntrada.clear(); //Para limpar o teclado
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controladorEntrada,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
              labelText: "Teste", labelStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];

          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              print(value);
              setState(() {
                item.done = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add, //Chama a funcao criada acima
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
