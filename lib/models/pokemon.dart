

import 'raw.dart' as raw;

class Pokemon {
  Pokemon(this.myRaw, {
      this.abilities,
      // this.baseExperience,
      // this.forms,
      // this.gameIndices,
      // this.height,
      // this.heldItems,
      this.id,
      // this.isDefault,
      // this.locationAreaEncounters,
      // this.moves,
      this.name,
      // this.order,
      // this.pastTypes,
      // this.species,
      this.sprites,
      // this.stats,
      // this.types,
      // this.weight
  });

  static Map<int, Pokemon> instances = <int, Pokemon>{};

  static bool hasInstance(int id){
    return instances.containsKey(id);
  }
  static Pokemon? getInstance(int id) {
    return instances[id];
  }
  static void setInstance(int id, Pokemon pokemon) {
    instances[id] = pokemon;
  }

  raw.Pokemon myRaw;

  List<PokemonAbility?>? abilities;
  // final int? baseExperience;
  // final List<NamedAPIResource?>? forms;
  // final List<VersionGameIndex?>? gameIndices;
  // final int? height;
  // final List<PokemonHeldItem?>? heldItems;
  int? id;
  // final bool? isDefault;
  // final String? locationAreaEncounters;
  // final List<PokemonMove?>? moves;
  String? name;
  // final int? order;
  // final List<PokemonTypePast?>? pastTypes;
  // final NamedAPIResource? species;
  PokemonSprites? sprites;
  // final List<PokemonStat?>? stats;
  // final List<PokemonType?>? types;
  // final int? weight;
}

class PokemonAbility{
  PokemonAbility({
    this.isHidden,
    this.slot,
    // this.ability,
  });

  final bool? isHidden;
  final int? slot;
  // final NamedAPIResource? ability;

}

// @JsonSerializable()
// class PokemonType{
//   PokemonType({
//     this.slot,
//     this.type,
//   });
//
//   final int? slot;
//   final NamedAPIResource? type;
//
//   factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
// }
//
// @JsonSerializable()
// class PokemonFormType{
//   PokemonFormType({
//     this.slot,
//     this.type,
//   });
//
//   final int? slot;
//   final NamedAPIResource? type;
//
//   factory PokemonFormType.fromJson(Map<String, dynamic> json) => _$PokemonFormTypeFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonFormTypeToJson(this);
// }
//
// @JsonSerializable()
// class PokemonTypePast{
//   PokemonTypePast({
//     this.generation,
//     this.types,
//   });
//
//   final NamedAPIResource? generation;
//   final List<PokemonType?>? types;
//
//   factory PokemonTypePast.fromJson(Map<String, dynamic> json) => _$PokemonTypePastFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonTypePastToJson(this);
// }
//
// @JsonSerializable()
// class PokemonHeldItem{
//   PokemonHeldItem({
//     this.item,
//     this.versionDetails,
//   });
//
//   final NamedAPIResource? item;
//   @JsonKey(name: 'version_details')
//   final List<PokemonHeldItemVersion?>? versionDetails;
//
//   factory PokemonHeldItem.fromJson(Map<String, dynamic> json) => _$PokemonHeldItemFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonHeldItemToJson(this);
// }
//
// @JsonSerializable()
// class PokemonHeldItemVersion{
//   PokemonHeldItemVersion({
//     this.version,
//     this.rarity,
//   });
//
//   final NamedAPIResource? version;
//   final int? rarity;
//
//   factory PokemonHeldItemVersion.fromJson(Map<String, dynamic> json) => _$PokemonHeldItemVersionFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonHeldItemVersionToJson(this);
// }
//
// @JsonSerializable()
// class PokemonMove{
//   PokemonMove({
//     this.move,
//     this.versionGroupDetails,
//   });
//
//   final NamedAPIResource? move;
//   @JsonKey(name: 'version_group_details')
//   final List<PokemonMoveVersion?>? versionGroupDetails;
//
//   factory PokemonMove.fromJson(Map<String, dynamic> json) => _$PokemonMoveFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonMoveToJson(this);
// }
//
// @JsonSerializable()
// class PokemonMoveVersion{
//   PokemonMoveVersion({
//     this.moveLearnMethod,
//     this.versionGroup,
//     this.levelLearnedAt,
//   });
//
//   @JsonKey(name: 'move_learn_method')
//   final NamedAPIResource? moveLearnMethod;
//   @JsonKey(name: 'version_group')
//   final NamedAPIResource? versionGroup;
//   @JsonKey(name: 'level_learned_at')
//   final int? levelLearnedAt;
//
//   factory PokemonMoveVersion.fromJson(Map<String, dynamic> json) => _$PokemonMoveVersionFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonMoveVersionToJson(this);
// }
//
// @JsonSerializable()
// class PokemonStat{
//   PokemonStat({
//     this.stat,
//     this.effort,
//     this.baseStat,
//   });
//
//   final NamedAPIResource? stat;
//   final int? effort;
//   @JsonKey(name: 'base_stat')
//   final int? baseStat;
//
//   factory PokemonStat.fromJson(Map<String, dynamic> json) => _$PokemonStatFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
// }

class PokemonSprites{
  PokemonSprites({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  final String? frontDefault;
  final String? frontShiny;
  final String? frontFemale;
  final String? frontShinyFemale;
  final String? backDefault;
  final String? backShiny;
  final String? backFemale;
  final String? backShinyFemale;

  static PokemonSprites? fromRaw(raw.PokemonSprites? sprites){
    if(sprites == null){
      return null;
    }
    return PokemonSprites(
      frontDefault: sprites.frontDefault,
      frontShiny: sprites.frontShiny,
      frontFemale: sprites.frontFemale,
      frontShinyFemale: sprites.frontShinyFemale,
      backDefault: sprites.backDefault,
      backShiny: sprites.backShiny,
      backFemale: sprites.backFemale,
      backShinyFemale: sprites.backShinyFemale,
    );
  }

}