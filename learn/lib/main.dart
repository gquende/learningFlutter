import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learn/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter',
      debugShowCheckedModeBanner: false, //Para elminar o simbolo do Debug
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
/*
    items.add(Item(title: "Item 1", done: false));
    items.add(Item(title: "Item 2", done: true));
    items.add(Item(title: "Item 3", done: false));
    items.add(Item(title: "Item 4", done: true));
*/

  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controladorEntrada = new TextEditingController(); //Classe que cria um controlador para insercao de txto

  _HomePageStage(){
    load();
  }

//Todo metodo que altera uma coisa na tela deve conter o setState
  void add() {
    if (controladorEntrada.text.isEmpty) return;
    setState(() {
      widget.items.add(Item(title: controladorEntrada.text, done: false));
      controladorEntrada.text = "";
      save();
    });
  }
  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    var prefs= await SharedPreferences.getInstance();//Cria uma instancia para a base de Dados
    var data= prefs.getString('data');
    if(data!=null)
      {
        Iterable decoded= jsonDecode(data);//
        List<Item> result= decoded.map((x) => Item.fromJson(x)).toList();//Converte os em Json e em sequida nu ma lista
      }
  }
  save() async {
    var prefs= await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));//Salva os dados em Json
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
              labelText: "Nome da tarefa",
              labelStyle: TextStyle(color: Colors.white)),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return Dismissible(
            key: Key(item.title),
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                print(value);
                setState(() {
                  item.done = value;
                  save();
                });
              },
            ),
            onDismissed: (direction) {
              print(direction);
              remove(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add, //Chama a funcao criada acima
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
c