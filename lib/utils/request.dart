import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/raw.dart' as raw;
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<raw.NamedAPIResource?>?> getPokemons(int qtsLoaded, int qtdItems) async{
  if(qtsLoaded + qtdItems >= 898){
    qtdItems = 898 - qtsLoaded;
  }
  final SharedPreferences prefs = await  SharedPreferences.getInstance();
  List<raw.NamedAPIResource?> res = <raw.NamedAPIResource?>[];
  int ini = qtsLoaded+1, fim = qtsLoaded + qtdItems;
  fim = min(fim, 898);
  for(ini; ini <= fim; ini++){
    String? message = prefs.getString("NamedAPIResource:Pokemon:$ini");
    if(message != null){
      res.add(raw.NamedAPIResource.fromJson(jsonDecode(message)));
      qtdItems--;
      qtsLoaded++;
    } else{
      break;
    }
  }
  if(qtdItems == 0){
    return res;
  }

  http.Response response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=$qtsLoaded&limit=$qtdItems'));
  Map<String, dynamic> jsonResponse = jsonDecode(response.body);

  List<dynamic>? resultsList = jsonResponse["results"];
  if(resultsList == null){
    return null;
  }
  RegExp regExp = RegExp(r"^\d*$");
  for (var shortPokemon in resultsList) {
    var named = raw.NamedAPIResource.fromJson(shortPokemon);
    if(regExp.hasMatch(named.id!) && int.parse(named.id!) <= 898){
      res.add(named);
    }

  }
  for (var shortPokemon in resultsList){
    var named = raw.NamedAPIResource.fromJson(shortPokemon);
    if(regExp.hasMatch(named.id!) && int.parse(named.id!) <= 898){
      if(!prefs.containsKey("NamedAPIResource:Pokemon:${named.id}")){
        await prefs.setString("NamedAPIResource:Pokemon:${named.id}", jsonEncode(shortPokemon));
      }
    }
  }

  return res;
}

Map<String, raw.Pokemon?> _pokemonMap = <String, raw.Pokemon?>{};

Future<raw.Pokemon?> getPokemon(String? idName) async{
  if(idName == null){
    return null;
  }
  if(_pokemonMap.containsKey(idName)){
    return _pokemonMap[idName];
  }
  final SharedPreferences prefs = await  SharedPreferences.getInstance();
  String? message = prefs.getString("Pokemon:$idName");

  Map<String, dynamic>? jsonResponse;
  raw.Pokemon? pokemon;
  if(message == null){
    http.Response response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$idName/'));
    message = response.body;
    jsonResponse = jsonDecode(message);
    pokemon = raw.Pokemon.fromJson(jsonResponse!);

    await prefs.setString("Pokemon:$idName", jsonEncode(pokemon.toJson()));
  } else{
    jsonResponse = jsonDecode(message);
    pokemon = raw.Pokemon.fromJson(jsonResponse!);
  }
  _pokemonMap[idName] = pokemon;

  return pokemon;
}

Map<String, raw.Ability?> _abilityMap = <String, raw.Ability?>{};

Future<raw.Ability?> getAbility(String? idName) async{
  if(idName == null){
    return null;
  }
  if(_abilityMap.containsKey(idName)){
    return _abilityMap[idName];
  }

  final SharedPreferences prefs = await  SharedPreferences.getInstance();
  String? message = prefs.getString("Ability:$idName");

  Map<String, dynamic>? jsonResponse;
  raw.Ability? ability;
  if(message == null){
    http.Response response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/ability/$idName/'));
    message = response.body;
    jsonResponse = jsonDecode(message);
    ability = raw.Ability.fromJson(jsonResponse!);
    await prefs.setString("Ability:$idName", jsonEncode(ability.toJson()));
  } else{
    jsonResponse = jsonDecode(message);
    ability = raw.Ability.fromJson(jsonResponse!);
  }

  _abilityMap[idName] = ability;

  return ability;
}