// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResource _$APIResourceFromJson(Map<String, dynamic> json) => APIResource(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$APIResourceToJson(APIResource instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      description: json['description'] as String?,
      language: json['language'] == null
          ? null
          : NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'description': instance.description,
      'language': instance.language,
    };

Effect _$EffectFromJson(Map<String, dynamic> json) => Effect(
      effect: json['effect'] as String?,
      language: json['language'] == null
          ? null
          : NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EffectToJson(Effect instance) => <String, dynamic>{
      'effect': instance.effect,
      'language': instance.language,
    };

Encounter _$EncounterFromJson(Map<String, dynamic> json) => Encounter(
      minLevel: json['min_level'] as int?,
      maxLevel: json['max_level'] as int?,
      conditionValues: (json['condition_values'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      chance: json['chance'] as int?,
      method: json['method'] == null
          ? null
          : NamedAPIResource.fromJson(json['method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EncounterToJson(Encounter instance) => <String, dynamic>{
      'min_level': instance.minLevel,
      'max_level': instance.maxLevel,
      'condition_values': instance.conditionValues,
      'chance': instance.chance,
      'method': instance.method,
    };

FlavorText _$FlavorTextFromJson(Map<String, dynamic> json) => FlavorText(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : NamedAPIResource.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextToJson(FlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

GenerationGameIndex _$GenerationGameIndexFromJson(Map<String, dynamic> json) =>
    GenerationGameIndex(
      gameIndex: json['game_index'] as int?,
      generation: json['generation'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationGameIndexToJson(
        GenerationGameIndex instance) =>
    <String, dynamic>{
      'game_index': instance.gameIndex,
      'generation': instance.generation,
    };

MachineVersionDetail _$MachineVersionDetailFromJson(
        Map<String, dynamic> json) =>
    MachineVersionDetail(
      machine: json['machine'] == null
          ? null
          : APIResource.fromJson(json['machine'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MachineVersionDetailToJson(
        MachineVersionDetail instance) =>
    <String, dynamic>{
      'machine': instance.machine,
      'version_group': instance.versionGroup,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      name: json['name'] as String?,
      language: json['language'] == null
          ? null
          : NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
    };

NamedAPIResource _$NamedAPIResourceFromJson(Map<String, dynamic> json) =>
    NamedAPIResource(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NamedAPIResourceToJson(NamedAPIResource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

VerboseEffect _$VerboseEffectFromJson(Map<String, dynamic> json) =>
    VerboseEffect(
      effect: json['effect'] as String?,
      shortEffect: json['short_effect'] as String?,
      language: json['language'] == null
          ? null
          : NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerboseEffectToJson(VerboseEffect instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'short_effect': instance.shortEffect,
      'language': instance.language,
    };

VersionEncounterDetail _$VersionEncounterDetailFromJson(
        Map<String, dynamic> json) =>
    VersionEncounterDetail(
      version: json['version'] == null
          ? null
          : NamedAPIResource.fromJson(json['version'] as Map<String, dynamic>),
      maxChance: json['max_chance'] as int?,
      encounterDetails: (json['encounter_details'] as List<dynamic>?)
          ?.map((e) => Encounter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VersionEncounterDetailToJson(
        VersionEncounterDetail instance) =>
    <String, dynamic>{
      'version': instance.version,
      'max_chance': instance.maxChance,
      'encounter_details': instance.encounterDetails,
    };

VersionGameIndex _$VersionGameIndexFromJson(Map<String, dynamic> json) =>
    VersionGameIndex(
      gameIndex: json['game_index'] as int?,
      version: json['version'] == null
          ? null
          : NamedAPIResource.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGameIndexToJson(VersionGameIndex instance) =>
    <String, dynamic>{
      'game_index': instance.gameIndex,
      'version': instance.version,
    };

VersionGroupFlavorText _$VersionGroupFlavorTextFromJson(
        Map<String, dynamic> json) =>
    VersionGroupFlavorText(
      text: json['text'] as String?,
      language: json['language'] == null
          ? null
          : NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGroupFlavorTextToJson(
        VersionGroupFlavorText instance) =>
    <String, dynamic>{
      'text': instance.text,
      'language': instance.language,
      'version_group': instance.versionGroup,
    };

NamedAPIResourceList _$NamedAPIResourceListFromJson(
        Map<String, dynamic> json) =>
    NamedAPIResourceList(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      result: json['result'] == null
          ? null
          : NamedAPIResource.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NamedAPIResourceListToJson(
        NamedAPIResourceList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'result': instance.result,
    };
