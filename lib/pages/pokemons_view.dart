import 'package:flutter/material.dart';
import '../utils/request.dart';
import 'package:flutter/foundation.dart';
import '../models/models.dart' as models;
import 'dart:core';

class PokemonsView extends StatefulWidget {
  const PokemonsView({Key? key}) : super(key: key);

  @override
  State<PokemonsView> createState() => _PokemonsView();
}

class _PokemonsView extends State<PokemonsView> {
  List<models.Pokemon?> pokemonsList = <models.Pokemon?>[];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    getPokemons(1, 15).then((pokemons) {
      if(pokemons != null){
        setState(() {
          pokemonsList.addAll(pokemons);
        });
      }
    });

    _scrollController.addListener(() {

    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemons"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {

        },
        itemCount: pokemonsList.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Image.network(pokemonsList[index]?.sprites?.frontDefault??"",
              // loadingBuilder: (context, child, loadingProgress) {
              //     debugPrint(pokemonsList[index]?.sprites?.frontDefault??"");
              //     if (loadingProgress == null) {
              //       return const CircularProgressIndicator();
              //     }
              //     return child;
              //   },
            ),
            title: Text(pokemonsList[index]?.name??""),

          );
        },
      ),
    );
  }
}
