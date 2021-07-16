import 'package:flutter/material.dart';
import 'package:learn/Bloc/home_bloc.dart';

class Home extends StatelessWidget {
  // const BlocTest({Key? key}) : super(key: key);
  HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    print("ola");
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Bloc Pattern"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: homeBloc.output,
          builder: (context, snap) {
            return Center(child: Text("${homeBloc.counter}"));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          homeBloc.increment();
        },
      ),
    );
  }
}
