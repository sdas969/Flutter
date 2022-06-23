// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'schema.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7210699001016348595),
      name: 'Note',
      lastPropertyId: const IdUid(9, 3365093861333795780),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8155877280774549595),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2475982420367896016),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8235581983718760064),
            name: 'interval',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2460376059315506292),
            name: 'unit',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2353440231197753837),
            name: 'date',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 319501497176924834),
            name: 'startTime',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 3365093861333795780),
            name: 'endTime',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 7210699001016348595),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [6402686193025920406, 8246040960868828373],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Note: EntityDefinition<Note>(
        model: _entities[0],
        toOneRelations: (Note object) => [],
        toManyRelations: (Note object) => {},
        getId: (Note object) => object.id,
        setId: (Note object, int id) {
          object.id = id;
        },
        objectToFB: (Note object, fb.Builder fbb) {
          final textOffset = fbb.writeString(object.text);
          final unitOffset = fbb.writeString(object.unit);
          final startTimeOffset = fbb.writeString(object.startTime);
          final endTimeOffset = fbb.writeString(object.endTime);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, textOffset);
          fbb.addInt64(4, object.interval);
          fbb.addOffset(5, unitOffset);
          fbb.addInt64(6, object.date.millisecondsSinceEpoch);
          fbb.addOffset(7, startTimeOffset);
          fbb.addOffset(8, endTimeOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Note(
              text: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              unit: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              interval:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0),
              startTime: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              endTime: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 20, ''),
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Note] entity fields to define ObjectBox queries.
class Note_ {
  /// see [Note.id]
  static final id = QueryIntegerProperty<Note>(_entities[0].properties[0]);

  /// see [Note.text]
  static final text = QueryStringProperty<Note>(_entities[0].properties[1]);

  /// see [Note.interval]
  static final interval =
      QueryIntegerProperty<Note>(_entities[0].properties[2]);

  /// see [Note.unit]
  static final unit = QueryStringProperty<Note>(_entities[0].properties[3]);

  /// see [Note.date]
  static final date = QueryIntegerProperty<Note>(_entities[0].properties[4]);

  /// see [Note.startTime]
  static final startTime =
      QueryStringProperty<Note>(_entities[0].properties[5]);

  /// see [Note.endTime]
  static final endTime = QueryStringProperty<Note>(_entities[0].properties[6]);
}