import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learn/TesteAprendizagem/ItemRefeito.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(App());//Inicia a aplicacao por intermedio da classe App
}

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Meu Teste de Aprendizagem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  var colecao= new List<Item>();//Cria uma colecao de items;

HomePage(){
  colecao= []; //Inicializa a lista de items;
}

@override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
  var controllerText= new TextEditingController(); //Cria um controlador para Insersao de Textos

_HomePageState(){
  print("Estou a funcionar lindamente");
}

@override
Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    appBar: AppBar(title: TextFormField(
      controller: controllerText,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(labelText: "Insira a tarefa",labelStyle: TextStyle(color: Colors.white)),
    ),),
body: ListView.builder(itemCount: widget.colecao.length,
itemBuilder: (context, index){

  return CheckboxListTile(title: Text(widget.colecao[index].title), value: widget.colecao[index].done,);
},),
  ) ;

  }



}

