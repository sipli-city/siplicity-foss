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

class GraphType extends $pb.ProtobufEnum {
  static const GraphType GRAPH_TYPE_UNSPECIFIED = GraphType._(0, _omitEnumNames ? '' : 'GRAPH_TYPE_UNSPECIFIED');
  static const GraphType GRAPH_TYPE_INPUT = GraphType._(1, _omitEnumNames ? '' : 'GRAPH_TYPE_INPUT');
  static const GraphType GRAPH_TYPE_OUTPUT = GraphType._(2, _omitEnumNames ? '' : 'GRAPH_TYPE_OUTPUT');

  static const $core.List<GraphType> values = <GraphType> [
    GRAPH_TYPE_UNSPECIFIED,
    GRAPH_TYPE_INPUT,
    GRAPH_TYPE_OUTPUT,
  ];

  static final $core.Map<$core.int, GraphType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GraphType? valueOf($core.int value) => _byValue[value];

  const GraphType._($core.int v, $core.String n) : super(v, n);
}

class ReportType extends $pb.ProtobufEnum {
  static const ReportType REPORT_TYPE_UNSPECIFIED = ReportType._(0, _omitEnumNames ? '' : 'REPORT_TYPE_UNSPECIFIED');
  static const ReportType REPORT_TYPE_EXTENSIONS = ReportType._(1, _omitEnumNames ? '' : 'REPORT_TYPE_EXTENSIONS');
  static const ReportType REPORT_TYPE_MODIFIED = ReportType._(2, _omitEnumNames ? '' : 'REPORT_TYPE_MODIFIED');
  static const ReportType REPORT_TYPE_ZERO_BYTE = ReportType._(3, _omitEnumNames ? '' : 'REPORT_TYPE_ZERO_BYTE');
  static const ReportType REPORT_TYPE_DUPLICATES = ReportType._(4, _omitEnumNames ? '' : 'REPORT_TYPE_DUPLICATES');
  static const ReportType REPORT_TYPE_FORMAT_CLASS = ReportType._(5, _omitEnumNames ? '' : 'REPORT_TYPE_FORMAT_CLASS');
  static const ReportType REPORT_TYPE_MIME_TYPE = ReportType._(6, _omitEnumNames ? '' : 'REPORT_TYPE_MIME_TYPE');
  static const ReportType REPORT_TYPE_FILE_FORMAT = ReportType._(7, _omitEnumNames ? '' : 'REPORT_TYPE_FILE_FORMAT');
  static const ReportType REPORT_TYPE_UNKNOWN = ReportType._(8, _omitEnumNames ? '' : 'REPORT_TYPE_UNKNOWN');
  static const ReportType REPORT_TYPE_MULTIPLE_IDENTIFICATION = ReportType._(9, _omitEnumNames ? '' : 'REPORT_TYPE_MULTIPLE_IDENTIFICATION');

  static const $core.List<ReportType> values = <ReportType> [
    REPORT_TYPE_UNSPECIFIED,
    REPORT_TYPE_EXTENSIONS,
    REPORT_TYPE_MODIFIED,
    REPORT_TYPE_ZERO_BYTE,
    REPORT_TYPE_DUPLICATES,
    REPORT_TYPE_FORMAT_CLASS,
    REPORT_TYPE_MIME_TYPE,
    REPORT_TYPE_FILE_FORMAT,
    REPORT_TYPE_UNKNOWN,
    REPORT_TYPE_MULTIPLE_IDENTIFICATION,
  ];

  static final $core.Map<$core.int, ReportType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportType? valueOf($core.int value) => _byValue[value];

  const ReportType._($core.int v, $core.String n) : super(v, n);
}

class RecordType extends $pb.ProtobufEnum {
  static const RecordType RECORD_TYPE_UNSPECIFIED = RecordType._(0, _omitEnumNames ? '' : 'RECORD_TYPE_UNSPECIFIED');
  static const RecordType RECORD_TYPE_SCHEMA = RecordType._(1, _omitEnumNames ? '' : 'RECORD_TYPE_SCHEMA');
  static const RecordType RECORD_TYPE_ROOT = RecordType._(2, _omitEnumNames ? '' : 'RECORD_TYPE_ROOT');
  static const RecordType RECORD_TYPE_FILE = RecordType._(3, _omitEnumNames ? '' : 'RECORD_TYPE_FILE');
  static const RecordType RECORD_TYPE_VIRTUAL_FILE = RecordType._(4, _omitEnumNames ? '' : 'RECORD_TYPE_VIRTUAL_FILE');
  static const RecordType RECORD_TYPE_DIRECTORY = RecordType._(5, _omitEnumNames ? '' : 'RECORD_TYPE_DIRECTORY');
  static const RecordType RECORD_TYPE_VIRTUAL_DIRECTORY = RecordType._(6, _omitEnumNames ? '' : 'RECORD_TYPE_VIRTUAL_DIRECTORY');
  static const RecordType RECORD_TYPE_ARCHIVE = RecordType._(7, _omitEnumNames ? '' : 'RECORD_TYPE_ARCHIVE');
  static const RecordType RECORD_TYPE_VIRTUAL_ARCHIVE = RecordType._(8, _omitEnumNames ? '' : 'RECORD_TYPE_VIRTUAL_ARCHIVE');

  static const $core.List<RecordType> values = <RecordType> [
    RECORD_TYPE_UNSPECIFIED,
    RECORD_TYPE_SCHEMA,
    RECORD_TYPE_ROOT,
    RECORD_TYPE_FILE,
    RECORD_TYPE_VIRTUAL_FILE,
    RECORD_TYPE_DIRECTORY,
    RECORD_TYPE_VIRTUAL_DIRECTORY,
    RECORD_TYPE_ARCHIVE,
    RECORD_TYPE_VIRTUAL_ARCHIVE,
  ];

  static final $core.Map<$core.int, RecordType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RecordType? valueOf($core.int value) => _byValue[value];

  const RecordType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
