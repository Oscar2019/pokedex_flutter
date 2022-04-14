import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/raw.dart' as raw;
import '../models/models.dart' as models;
import '../models/raw/utility.dart';
import 'dart:core';
import 'dart:developer';

Future<List<models.Pokemon?>?> getPokemons(int qtsLoaded, int qtdItems) async{
  http.Response response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=${qtsLoaded}&limit=${qtdItems}'));
  Map<String, dynamic> jsonResponse = jsonDecode(response.body);

  List<dynamic>? resultsList = jsonResponse["results"];
  if(resultsList == null){
    return null;
  }
  List<models.Pokemon?>? resultsList2 = await Future.wait<models.Pokemon?>(resultsList.map(
    (element) async {
      raw.NamedAPIResource nar = raw.NamedAPIResource.fromJson(element);
      String? idName = nar.id;
      if (idName == null) {
        return null;
      }
      models.Pokemon? myPokemon = await getPokemon(idName);
      if(myPokemon == null){
        return null;
      }
      myPokemon.abilities = myPokemon.myRaw.abilities?.map(
              (ability) => models.PokemonAbility(
              isHidden: ability?.isHidden,
              slot: ability?.slot
          )
      ).toList();
      myPokemon.id = myPokemon.myRaw.id;
      myPokemon.name = myPokemon.myRaw.name;
      myPokemon.sprites = models.PokemonSprites.fromRaw(myPokemon.myRaw.sprites);
      return myPokemon;
    }
  ));
  return resultsList2;
}

Future<models.Pokemon?> getPokemon(String idName) async{
  int? id = int.tryParse(idName);

  if (id == null) {
    raw.Pokemon? myPokemon = await getRawPokemon(idName);
    if(myPokemon == null){
      return null;
    }
    id = myPokemon.id;
    if(id == null){
      return null;
    }
    if(!models.Pokemon.hasInstance(id)){
      models.Pokemon.setInstance(id, models.Pokemon(myPokemon));
    }
  } else{
    if(!models.Pokemon.hasInstance(id)){
      raw.Pokemon? myPokemon = await getRawPokemon(idName);
      if(myPokemon == null){
        return null;
      }
      models.Pokemon.setInstance(id, models.Pokemon(myPokemon));
    }
  }
  return models.Pokemon.getInstance(id);
}

Future<raw.Pokemon?> getRawPokemon(String idName) async{
  http.Response response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${idName}/'));
  Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  raw.Pokemon pokemon = raw.Pokemon.fromJson(jsonResponse);

  return pokemon;
}