import 'dart:async';

import 'package:flutter/material.dart';
import '../utils/request.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;
import '../models/models.dart' as models;
import 'dart:core';
import '../utils/string.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key, required this.pokemon}) : super(key: key);
  final models.Pokemon pokemon;

  @override
  State<PokemonView> createState() => _PokemonView();
}

class _PokemonView extends State<PokemonView> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    // _pageController.
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imageList = <Widget>[];
    var sprites = widget.pokemon.sprites;
    if(sprites != null){
      List<String> nameImageList = <String>[];
      String? curImage;
      curImage = sprites.frontDefault;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.frontShiny;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.frontFemale;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.frontShinyFemale;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.backDefault;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.backShiny;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.backFemale;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      curImage = sprites.backShinyFemale;
      if(curImage != null){
        nameImageList.add(curImage);
      }
      for(var image in nameImageList){
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name??""),
      ),
      body: PageView(
        controller: _pageController,
        children: imageList,
      ),
    );
  }
}
