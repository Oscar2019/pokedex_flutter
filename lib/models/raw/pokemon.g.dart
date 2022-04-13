// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseExperience: json['base_experience'] as int?,
      forms: (json['forms'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameIndices: (json['game_indices'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VersionGameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: json['height'] as int?,
      heldItems: (json['held_items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonHeldItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      isDefault: json['is_default'] as bool?,
      locationAreaEncounters: json['location_area_encounters'] as String?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonMove.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      order: json['order'] as int?,
      pastTypes: (json['past_types'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonTypePast.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: json['species'] == null
          ? null
          : NamedAPIResource.fromJson(json['species'] as Map<String, dynamic>),
      sprites: json['sprites'] == null
          ? null
          : PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'forms': instance.forms,
      'game_indices': instance.gameIndices,
      'height': instance.height,
      'held_items': instance.heldItems,
      'id': instance.id,
      'is_default': instance.isDefault,
      'location_area_encounters': instance.locationAreaEncounters,
      'moves': instance.moves,
      'name': instance.name,
      'order': instance.order,
      'past_types': instance.pastTypes,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      isHidden: json['is_hidden'] as bool?,
      slot: json['slot'] as int?,
      ability: json['ability'] == null
          ? null
          : NamedAPIResource.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : NamedAPIResource.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonFormType _$PokemonFormTypeFromJson(Map<String, dynamic> json) =>
    PokemonFormType(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : NamedAPIResource.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonFormTypeToJson(PokemonFormType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonTypePast _$PokemonTypePastFromJson(Map<String, dynamic> json) =>
    PokemonTypePast(
      generation: json['generation'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['generation'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonTypePastToJson(PokemonTypePast instance) =>
    <String, dynamic>{
      'generation': instance.generation,
      'types': instance.types,
    };

PokemonHeldItem _$PokemonHeldItemFromJson(Map<String, dynamic> json) =>
    PokemonHeldItem(
      item: json['item'] == null
          ? null
          : NamedAPIResource.fromJson(json['item'] as Map<String, dynamic>),
      versionDetails: (json['version_details'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonHeldItemVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonHeldItemToJson(PokemonHeldItem instance) =>
    <String, dynamic>{
      'item': instance.item,
      'version_details': instance.versionDetails,
    };

PokemonHeldItemVersion _$PokemonHeldItemVersionFromJson(
        Map<String, dynamic> json) =>
    PokemonHeldItemVersion(
      version: json['version'] == null
          ? null
          : NamedAPIResource.fromJson(json['version'] as Map<String, dynamic>),
      rarity: json['rarity'] as int?,
    );

Map<String, dynamic> _$PokemonHeldItemVersionToJson(
        PokemonHeldItemVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'rarity': instance.rarity,
    };

PokemonMove _$PokemonMoveFromJson(Map<String, dynamic> json) => PokemonMove(
      move: json['move'] == null
          ? null
          : NamedAPIResource.fromJson(json['move'] as Map<String, dynamic>),
      versionGroupDetails: (json['version_group_details'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonMoveVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonMoveToJson(PokemonMove instance) =>
    <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.versionGroupDetails,
    };

PokemonMoveVersion _$PokemonMoveVersionFromJson(Map<String, dynamic> json) =>
    PokemonMoveVersion(
      moveLearnMethod: json['move_learn_method'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['move_learn_method'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
      levelLearnedAt: json['level_learned_at'] as int?,
    );

Map<String, dynamic> _$PokemonMoveVersionToJson(PokemonMoveVersion instance) =>
    <String, dynamic>{
      'move_learn_method': instance.moveLearnMethod,
      'version_group': instance.versionGroup,
      'level_learned_at': instance.levelLearnedAt,
    };

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      stat: json['stat'] == null
          ? null
          : NamedAPIResource.fromJson(json['stat'] as Map<String, dynamic>),
      effort: json['effort'] as int?,
      baseStat: json['base_stat'] as int?,
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'stat': instance.stat,
      'effort': instance.effort,
      'base_stat': instance.baseStat,
    };

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      backFemale: json['back_female'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
      'front_female': instance.frontFemale,
      'front_shiny_female': instance.frontShinyFemale,
      'back_default': instance.backDefault,
      'back_shiny': instance.backShiny,
      'back_female': instance.backFemale,
      'back_shiny_female': instance.backShinyFemale,
    };
