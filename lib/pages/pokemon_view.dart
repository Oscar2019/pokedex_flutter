import 'package:flutter/material.dart';
import '../utils/request.dart';
import '../models/raw.dart' as raw;
import 'dart:core';
import '../utils/string.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key, required this.pokemon}) : super(key: key);
  final raw.Pokemon pokemon;

  @override
  State<PokemonView> createState() => _PokemonView();
}

class _PokemonView extends State<PokemonView> {
  late raw.Pokemon _pokemon;
  List<Future<raw.Ability?>> _futureAbilityList = <Future<raw.Ability?>>[];
  final PageController _photoPageController = PageController(
    initialPage: 0,
  );
  late PageController _abilityPageController1;
  late PageController _abilityPageController2;
  int _abilityControllerTap = 0;
  bool _abilityShortExibition = true;
  // List<GlobalKey> _abilityGlobalKeys = <GlobalKey>[];
  double _abilitySizeTextBox = 40;
  int _currentPageAbility1 = 0;
  int _currentPageAbility2 = 0;

  double _typeHeightCardBox = 0;
  double _typeWidthCardBox = 0;

  final double _statHeightChart = 18;

  @override
  void initState() {
    super.initState();
    _pokemon = widget.pokemon;

    _abilityPageController1 = PageController(
      initialPage: widget.pokemon.abilities?.length != null ? 2 * widget.pokemon.abilities!.length : 0,
      viewportFraction: 2/5,
    );
    _abilityPageController2 = PageController(
      initialPage: widget.pokemon.abilities?.length != null ? 2 * widget.pokemon.abilities!.length : 0,
      viewportFraction: 1,
    );
    if(_pokemon.abilities != null && _pokemon.abilities!.isNotEmpty){
      _abilityPageController1.addListener(() {
        if(_abilityControllerTap == 1){
          _abilityPageController2.position.correctPixels(_abilityPageController1.offset * _abilityPageController2.viewportFraction / _abilityPageController1.viewportFraction);
          _abilityPageController2.position.notifyListeners();
          // if((_abilityPageController1.page!.floor() - _abilityPageController1.page!) < 0.01 || (_abilityPageController1.page!.ceil() - _abilityPageController1.page!) < 0.01){
          //   setState(() {});
          // }
        }
        final _newPage = _abilityPageController1.page!.round();
        if (_currentPageAbility1 != _newPage) {
          setState(() => _currentPageAbility1 = _newPage);
        }
      });
      _abilityPageController2.addListener(() {
        if(_abilityControllerTap == 2) {
          _abilityPageController1.position.correctPixels(_abilityPageController2.offset * _abilityPageController1.viewportFraction / _abilityPageController2.viewportFraction);
          _abilityPageController1.position.notifyListeners();
          // if((_abilityPageController2.page!.floor() - _abilityPageController2.page!) < 0.01 || (_abilityPageController2.page!.ceil() - _abilityPageController2.page!) < 0.01){
          //   setState(() {});
          // }
        }
        final _newPage = _abilityPageController2.page!.round();
        if (_currentPageAbility2 != _newPage) {
          setState(() => _currentPageAbility2 = _newPage);
        }
      });

      _futureAbilityList = _pokemon.abilities!.map((e) {
        return getAbility(e?.ability?.id);
      }).toList(growable: false);

      // _abilityGlobalKeys = List<GlobalKey>.generate(_pokemon.abilities!.length, (index){
      //   return GlobalKey();
      // });
    }


  }

  @override
  void dispose() {
    _photoPageController.dispose();
    _abilityPageController1.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // Constructor Images
    List<Widget> imageList = <Widget>[];

    var sprites = widget.pokemon.sprites;
    if(sprites != null){
      List<String> nameImageList = <String>[];
      String? curImage;
      curImage = sprites.other?.officialArtwork?.frontDefault;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.frontDefault;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      for(var image in nameImageList){
        if(!RegExp(r"(.svg)$").hasMatch(image)){
          imageList.add(Center(
            child: Image.network(image,
              loadingBuilder: (context, child, loadingProgress) {
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
            )
          ));
        } else{
          imageList.add(Center(
            child: SvgPicture.network(image,
              placeholderBuilder: (context) {
                return const CircularProgressIndicator();
              },
            )
          ));
        }
      }
    } else{
      imageList.add(const Center(
          child: Icon(
            Icons.question_mark,
            color: Colors.blue,
            size: 30.0,
          )
      ));
    }

    // Constructor Abilities


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name?.capitalize()??""),
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.width - 16,
              child: PageView(
                controller: _photoPageController,
                children: imageList,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Number",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(_pokemon.id.toString())
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Height",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(_pokemon.height.toString())
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Weight",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(_pokemon.weight.toString())
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (_pokemon.types == null || (_pokemon.types != null && _pokemon.types!.isEmpty)) ? const Align(
                alignment: Alignment.centerLeft,
                child: Text("Don't have any Types!",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ) : Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_pokemon.types!.length == 1? "Type" : "Types",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: _typeHeightCardBox,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _pokemon.types!.map((type){
                          return SizedBox(
                            width: 100,
                            child: OverflowBox(
                                minHeight: 0,
                                maxHeight: double.infinity,
                                alignment: Alignment.center,
                                child: Builder(
                                    builder: (context) {
                                      if(_typeHeightCardBox == 0 && _typeWidthCardBox == 0){
                                        WidgetsBinding.instance!.addPostFrameCallback((_){
                                          if (!mounted) {
                                            return;
                                          }
                                          setState(() {
                                            _typeHeightCardBox = context.size!.height;
                                            _typeWidthCardBox = context.size!.width;
                                          });
                                        });
                                      }
                                      return Card(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: const [0.5, 0.5],
                                                colors: (String type){
                                                  if(type.compareTo("bug") == 0){
                                                    return [const Color(0xFF729F3F), const Color(0xFF729F3F)];
                                                  } else if(type.compareTo("dragon") == 0){
                                                    return [const Color(0xFF53A4CF), const Color(0xFFF16E57)];
                                                  } else if(type.compareTo("fairy") == 0){
                                                    return [const Color(0xFFFDB9E9), const Color(0xFFFDB9E9)];
                                                  } else if(type.compareTo("fire") == 0){
                                                    return [const Color(0xFFFD7D24), const Color(0xFFFD7D24)];
                                                  } else if(type.compareTo("ghost") == 0){
                                                    return [const Color(0xFF7B62A3), const Color(0xFF7B62A3)];
                                                  } else if(type.compareTo("ground") == 0){
                                                    return [const Color(0xFFF7DE3F), const Color(0xFFAB9842)];
                                                  } else if(type.compareTo("normal") == 0){
                                                    return [const Color(0xFFA4ACAF), const Color(0xFFA4ACAF)];
                                                  } else if(type.compareTo("psychic") == 0){
                                                    return [const Color(0xFFF366B9), const Color(0xFFF366B9)];
                                                  } else if(type.compareTo("steel") == 0){
                                                    return [const Color(0xFF9EB7B8), const Color(0xFF9EB7B8)];
                                                  } else if(type.compareTo("dark") == 0){
                                                    return [const Color(0xFF424242), const Color(0xFF424242)];
                                                  } else if(type.compareTo("electric") == 0){
                                                    return [const Color(0xFFEED535), const Color(0xFFEED535)];
                                                  } else if(type.compareTo("fighting") == 0){
                                                    return [const Color(0xFFD56723), const Color(0xFFD56723)];
                                                  } else if(type.compareTo("flying") == 0){
                                                    return [const Color(0xFF3DC7EF), const Color(0xFFBDB9B8)];
                                                  } else if(type.compareTo("grass") == 0){
                                                    return [const Color(0xFF9BCC50), const Color(0xFF9BCC50)];
                                                  } else if(type.compareTo("ice") == 0){
                                                    return [const Color(0xFF51C4E7), const Color(0xFF51C4E7)];
                                                  } else if(type.compareTo("poison") == 0){
                                                    return [const Color(0xFFB97FC9), const Color(0xFFB97FC9)];
                                                  } else if(type.compareTo("rock") == 0){
                                                    return [const Color(0xFFA38C21), const Color(0xFFA38C21)];
                                                  } else if(type.compareTo("water") == 0){
                                                    return [const Color(0xFF4592C4), const Color(0xFF4592C4)];
                                                  }
                                                  return [const Color(0xFFA4ACAF), const Color(0xFFA4ACAF)];
                                                }(type?.type?.name??"type")
                                            ),
                                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text((type?.type?.name??"type").capitalize(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: (String type){
                                                    if(type.compareTo("bug") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("dragon") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("fairy") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("fire") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("ghost") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("ground") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("normal") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("psychic") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("steel") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("dark") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("electric") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("fighting") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("flying") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("grass") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("ice") == 0){
                                                      return Colors.black;
                                                    } else if(type.compareTo("poison") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("rock") == 0){
                                                      return Colors.white;
                                                    } else if(type.compareTo("water") == 0){
                                                      return Colors.white;
                                                    }
                                                    return Colors.black;
                                                  }(type?.type?.name??"type")
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                )
                            ),
                          );
                        }).toList(growable: false),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (_pokemon.abilities == null || (_pokemon.abilities != null && _pokemon.abilities!.isEmpty)) ? const Align(
                alignment: Alignment.centerLeft,
                child: Text("Don't have any Abilities!",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ) : Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_pokemon.abilities!.length == 1? "Ability" : "Abilities",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _abilityControllerTap = 1;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        _abilityControllerTap = -1;
                      });
                    },
                    child: SizedBox(
                      height: 40,
                      child: PageView.builder(
                        controller: _abilityPageController1,
                        itemBuilder: (context, index){
                          return FutureBuilder(
                            future: _futureAbilityList[index % _pokemon.abilities!.length],
                            builder: (context, snapshot) {
                              return Center(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        _abilityShortExibition = !_abilityShortExibition;
                                      });
                                    },
                                    child: Text((_pokemon.abilities?[index % _pokemon.abilities!.length]?.ability?.name??"ability").capitalize(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                        snapshot.hasData ?
                                        (
                                            _abilityPageController1.page?.floor().toInt() == index ?
                                            Colors.white
                                                :
                                            Colors.black
                                        )
                                            : Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      // MaterialStateProperty<OutlinedBorder?>
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0)
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty.all<Size>(
                                        const Size(232, 40),
                                      ),
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                        snapshot.hasData ?
                                        (
                                            _abilityPageController1.page?.floor().toInt() == index ?
                                            (_abilityShortExibition ? Colors.blue.shade400 : Colors.blue)
                                                :
                                            (_abilityShortExibition ? Colors.blue.shade100 : Colors.blue.shade400)
                                        )
                                            : Colors.blue.shade50,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        padEnds: false,
                        onPageChanged: (value){
                          if(value >= 3 * _pokemon.abilities!.length){
                            _abilityPageController1.animateToPage(2 * _pokemon.abilities!.length  + value % _pokemon.abilities!.length,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          } else if(value <= 1 * _pokemon.abilities!.length){
                            _abilityPageController1.animateToPage(2 * _pokemon.abilities!.length  + value % _pokemon.abilities!.length,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear,
                            );
                          }
                        },
                        // physics: ClampingScrollPhysics(),
                        allowImplicitScrolling: true,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _abilityControllerTap = 2;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        _abilityControllerTap = -2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: _abilitySizeTextBox,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: PageView.builder(
                            controller: _abilityPageController2,
                            itemBuilder: (context, index){
                              return OverflowBox(
                                minHeight: 0,
                                maxHeight: double.infinity,
                                child: FutureBuilder(
                                  future: _futureAbilityList[index % _pokemon.abilities!.length],
                                  builder: (context, snapshot) {
                                    // _abilitySizeTextBox = 18;
                                    String view = "Loading";
                                    if(snapshot.hasData){
                                      raw.Ability? data = snapshot.data as raw.Ability;
                                      for(var effect in data.effectEntries!){
                                        if(effect!.language!.name!.compareTo("en") == 0){
                                          if(_abilityShortExibition){
                                            view = effect.shortEffect!;
                                          } else{
                                            view = effect.effect!;
                                          }
                                          break;
                                        }
                                      }
                                    }
                                    if(_currentPageAbility2 == index){
                                      WidgetsBinding.instance!.addPostFrameCallback((_){
                                        if (!mounted) {
                                          return;
                                        }
                                        setState(() {
                                          _abilitySizeTextBox = context.size!.height;
                                        });
                                      });
                                    }
                                    // context.size.height
                                    return Center(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(view,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            padEnds: false,
                            onPageChanged: (value){
                              if(value >= 3 * _pokemon.abilities!.length){
                                _abilityPageController2.animateToPage(2 * _pokemon.abilities!.length + value % _pokemon.abilities!.length,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              } else if(value <= 1 * _pokemon.abilities!.length){
                                _abilityPageController2.animateToPage(2 * _pokemon.abilities!.length + value % _pokemon.abilities!.length,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              }
                            },
                            allowImplicitScrolling: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (_pokemon.stats == null || (_pokemon.stats != null && _pokemon.stats!.isEmpty)) ? const Align(
                alignment: Alignment.centerLeft,
                child: Text("Don't have any Stats!",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ) : Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Stats",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Column(
                        children: _pokemon.stats!.map((value){
                          return Container(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(value!.stat!.name!.capitalize() + ":",
                                textAlign: TextAlign.right,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Expanded(
                        child: Column(
                          children: _pokemon.stats!.map((value){
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 1,
                                left: 4,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [value!.baseStat!/255, 0.0],
                                    colors: const [Colors.blue, Colors.grey],
                                    tileMode: TileMode.mirror
                                  )
                                ),
                                height: _statHeightChart + 3,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
