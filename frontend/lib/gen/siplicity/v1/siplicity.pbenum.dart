//
//  Generated code. Do not modify.
//  source: siplicity/v1/siplicity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RecordType extends $pb.ProtobufEnum {
  static const RecordType RECORD_TYPE_UNSPECIFIED = RecordType._(0, _omitEnumNames ? '' : 'RECORD_TYPE_UNSPECIFIED');
  static const RecordType RECORD_TYPE_FILE = RecordType._(1, _omitEnumNames ? '' : 'RECORD_TYPE_FILE');
  static const RecordType RECORD_TYPE_VIRTUAL_FILE = RecordType._(2, _omitEnumNames ? '' : 'RECORD_TYPE_VIRTUAL_FILE');
  static const RecordType RECORD_TYPE_DIRECTORY = RecordType._(3, _omitEnumNames ? '' : 'RECORD_TYPE_DIRECTORY');
  static const RecordType RECORD_TYPE_VIRTUAL_DIRECTORY = RecordType._(4, _omitEnumNames ? '' : 'RECORD_TYPE_VIRTUAL_DIRECTORY');
  static const RecordType RECORD_TYPE_COMPRESSED_FILE = RecordType._(5, _omitEnumNames ? '' : 'RECORD_TYPE_COMPRESSED_FILE');
  static const RecordType RECORD_TYPE_COMPRESSED_DIRECTORY = RecordType._(6, _omitEnumNames ? '' : 'RECORD_TYPE_COMPRESSED_DIRECTORY');

  static const $core.List<RecordType> values = <RecordType> [
    RECORD_TYPE_UNSPECIFIED,
    RECORD_TYPE_FILE,
    RECORD_TYPE_VIRTUAL_FILE,
    RECORD_TYPE_DIRECTORY,
    RECORD_TYPE_VIRTUAL_DIRECTORY,
    RECORD_TYPE_COMPRESSED_FILE,
    RECORD_TYPE_COMPRESSED_DIRECTORY,
  ];

  static final $core.Map<$core.int, RecordType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RecordType? valueOf($core.int value) => _byValue[value];

  const RecordType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
