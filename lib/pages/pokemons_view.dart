import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import '../utils/request.dart';
import 'pokemon_view.dart';
import '../models/raw.dart' as raw;
import 'dart:core';
import '../utils/string.dart';

class PokemonsView extends StatefulWidget {
  const PokemonsView({Key? key}) : super(key: key);

  @override
  State<PokemonsView> createState() => _PokemonsView();
}


class _PokemonsView extends State<PokemonsView> {
  final List<Result<raw.Pokemon?>> _pokemonsList = <Result<raw.Pokemon?>>[];
  final List<Result<raw.Pokemon?>> _pokemonsTotalList = <Result<raw.Pokemon?>>[];
  // final List<raw.NamedAPIResource?> _pokemonsTotalList = <raw.NamedAPIResource?>[];
  int _lastLoaded = 0;
  bool _hasInternet = true;

  // List<raw.NamedAPIResource?> _pokemonsTotalSublist = <raw.NamedAPIResource?>[];
  late Future<List<raw.NamedAPIResource?>?> _futurePokemonsTotalSublist;
  final ScrollController _scrollController = ScrollController();
  bool _allPokemonLoaded = false;

  bool _needLoad = false;
  bool _loading = false;
  int _sortSelect = 0;
  int _idLastDirection = 1;
  int _weightLastDirection = 1;
  int _heightLastDirection = 1;
  // Map<String, Completer<raw.Pokemon>> countAux = <String, Completer<raw.Pokemon>>{};
  //
  // if()

  void loadMore(int qtdToLoad){
    // page++;
    _loading = true;
    int qtdAux = _pokemonsList.length + 15;
    if(_pokemonsTotalList.length > _pokemonsList.length){
      setState(() {
        while(_pokemonsList.length < qtdAux && _lastLoaded < _pokemonsTotalList.length){
            _pokemonsList.add(_pokemonsTotalList[_lastLoaded]);
            _lastLoaded++;
        }
      });
      _loading = false;
      _needLoad = false;
    } else{
      _needLoad = true;
    }
  }

  void _onPokemonSublistError(Object error){
    setState(() {
      _hasInternet = false;
    });
  }
  void _onPokemonSublistLoad(List<raw.NamedAPIResource?>? value) async{
    if(value != null && value.isNotEmpty){
      for (var element in value) {
        try{
          _pokemonsTotalList.add(Result.value(await getPokemon(element?.id)));
        } catch(e){
          _pokemonsTotalList.add(Result.error(e));
        }
      }
      debugPrint("_pokemonsTotalList.length = ${_pokemonsTotalList.length}");
      if(_needLoad){
        _needLoad = false;
        loadMore(15);
      }
      _futurePokemonsTotalSublist = getPokemons(_pokemonsTotalList.length, 15)
          ..then(_onPokemonSublistLoad)
          ..catchError(_onPokemonSublistError);
    } else{
      setState(() {
        _allPokemonLoaded = true;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _needLoad = true;
    _futurePokemonsTotalSublist = getPokemons(_pokemonsTotalList.length, 15)
        ..then(_onPokemonSublistLoad)
        ..catchError(_onPokemonSublistError);
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent-300 && !_loading){
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
    if(_hasInternet){
      List<Widget> appBarActionList = <Widget>[];

      if(_allPokemonLoaded){
        appBarActionList.add(PopupMenuButton<int>(
          onSelected: (value){
            if(value == 1){
              if(value == _sortSelect){
                setState(() {
                  _idLastDirection = -_idLastDirection;
                });
              }
              setState(() {
                _pokemonsTotalList.sort((Result<raw.Pokemon?> a, Result<raw.Pokemon?> b){
                  if(a.isValue && b.isValue){
                    return _idLastDirection * a.asValue!.value!.id!.compareTo(b.asValue!.value!.id!);
                  }if(a.isValue){
                    return -1;
                  }if(b.isValue){
                    return 1;
                  } else{
                    return 0;
                  }
                });
              });
            } else if(value == 2){
              if(value == _sortSelect) {
                setState(() {
                  _weightLastDirection = -_weightLastDirection;
                });
              }
              setState(() {
                _pokemonsTotalList.sort((Result<raw.Pokemon?> a, Result<raw.Pokemon?> b){
                  if(a.isValue && b.isValue){
                    return _weightLastDirection * a.asValue!.value!.weight!.compareTo(b.asValue!.value!.weight!);
                  }if(a.isValue){
                    return -1;
                  }if(b.isValue){
                    return 1;
                  } else{
                    return 0;
                  }
                });
              });
            } else if(value == 3){
              if(value == _sortSelect) {
                setState(() {
                  _heightLastDirection = -_heightLastDirection;
                });
              }
              setState(() {
                _pokemonsTotalList.sort((Result<raw.Pokemon?> a, Result<raw.Pokemon?> b){
                  if(a.isValue && b.isValue){
                    return _heightLastDirection * a.asValue!.value!.height!.compareTo(b.asValue!.value!.height!);
                  }if(a.isValue){
                    return -1;
                  }if(b.isValue){
                    return 1;
                  } else{
                    return 0;
                  }
                });
              });
            }
            setState(() {
              _sortSelect = value;
              _lastLoaded = 0;
              _pokemonsList.clear();
            });
            loadMore(15);

          },
          icon:  const Icon(
            Icons.sort,
            color: Colors.white,
          ),
          itemBuilder: (context){
            return <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    const Text("ID"),
                    Icon(_idLastDirection == 1 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: _sortSelect != 1 ? Colors.grey : Colors.black,
                    )
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: [
                    const Text("Weight"),
                    Icon(_weightLastDirection == 1 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: _sortSelect != 2 ? Colors.grey : Colors.black,
                    ),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Row(
                  children: [
                    const Text("Height"),
                    Icon(_heightLastDirection == 1 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: _sortSelect != 3 ? Colors.grey : Colors.black,
                    )
                  ],
                ),
              ),
            ];
          },
        ));
      } else{
        appBarActionList.add(
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
        );
      }

      return Scaffold(
          appBar: AppBar(
            title: const Text("Pokemons"),
            actions: appBarActionList,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if(_pokemonsList.isNotEmpty){
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: _pokemonsList.length,
                  itemBuilder: (BuildContext context, int index){
                    // raw.NamedAPIResource? shortPokemon =
                    Widget? wait;
                    Result<raw.Pokemon?> result = _pokemonsList[index];
                    raw.Pokemon? pokemon;
                    Widget? image;
                    if(result.isValue){
                      pokemon = result.asValue!.value!;
                      image = Image.network(pokemon.sprites?.frontDefault??"",
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            wait = null;
                            return child;
                          }
                          wait ??= const CircularProgressIndicator();
                          return wait!;
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
                    } else if(result.isError){
                      wait = null;
                      image = const Icon(
                        Icons.question_mark,
                        // IconData(0xf0555, fontFamily: 'MaterialIcons'),
                        color: Colors.blue,
                        size: 30.0,
                      );
                    } else{
                      wait ??= const CircularProgressIndicator();
                      image = wait;
                      // image = const CircularProgressIndicator();
                    }
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: ListTile(
                        leading: SizedBox(
                            width: 55,
                            height: 55,
                            child: Center(
                                child: image
                            )
                        ),
                        title: Text(pokemon?.name?.capitalize()??"Loading"),
                        onTap: pokemon != null ? (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return PokemonView(pokemon: pokemon!);
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
    } else{
      return Scaffold(
        appBar: AppBar(
        title: const Text("Pokemons"),
        ),
        body: const Center(
          child: Text("Don't have internet!"),
        ),
      );
    }
  }
}
