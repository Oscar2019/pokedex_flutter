import 'dart:async';

import 'package:flutter/material.dart';
import '../utils/request.dart';
import 'package:flutter/foundation.dart';
import 'pokemon_view.dart';
import 'dart:ui' as ui;
import '../models/models.dart' as models;
import 'dart:core';
import '../utils/string.dart';

class PokemonsView extends StatefulWidget {
  const PokemonsView({Key? key}) : super(key: key);

  @override
  State<PokemonsView> createState() => _PokemonsView();
}

class _PokemonsView extends State<PokemonsView> {
  List<models.Pokemon?> pokemonsList = <models.Pokemon?>[];
  ScrollController _scrollController = ScrollController();
  // int page = 0;
  bool loading = false;
  void loadMore(int qtdToload){
    // page++;
    loading = true;
    getPokemons(pokemonsList.length, qtdToload).then((pokemons) {
      if(pokemons != null){
        if(pokemons.isNotEmpty){
          setState(() {
            pokemonsList.addAll(pokemons);
          });
          loading = false;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadMore(15);

    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent-300 && !loading){
        loadMore(15);
      }
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
        title: const Text("Pokemons"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(pokemonsList.isNotEmpty){
            return ListView.builder(
              controller: _scrollController,
              // separatorBuilder: (context, index) {
              //   return const Divider();
              // },
              itemCount: pokemonsList.length,
              itemBuilder: (BuildContext context, int index){
                models.Pokemon? pokemon = pokemonsList[index];
                Image image = Image.network(pokemon?.sprites?.frontDefault??"",
                  loadingBuilder: (context, child, loadingProgress) {
                    double value = 55;
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                    // return const CircularProgressIndicator();
                  },
                  errorBuilder: (context, error, stackTrace){
                    return const Icon(
                      Icons.question_mark,
                      // IconData(0xf0555, fontFamily: 'MaterialIcons'),
                      color: Colors.blue,
                      size: 30.0,
                    );
                  },
                );


                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: ListTile(
                    leading: Container(
                      width: 55,
                      height: 55,
                      child: Center(
                        child: image
                      )
                    ),
                    title: Text(pokemon?.name?.capitalize()??""),
                    onTap: pokemon != null ? (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return PokemonView(pokemon: pokemon);
                      },));
                    } : null,
                  ),
                );
              },
            );
          } else{
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        },
      )

    );
  }
}
