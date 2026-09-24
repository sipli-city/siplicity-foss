//
//  Generated code. Do not modify.
//  source: siplicity/v1/siplicity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use recordTypeDescriptor instead')
const RecordType$json = {
  '1': 'RecordType',
  '2': [
    {'1': 'RECORD_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'RECORD_TYPE_ROOT', '2': 1},
    {'1': 'RECORD_TYPE_FILE', '2': 2},
    {'1': 'RECORD_TYPE_VIRTUAL_FILE', '2': 3},
    {'1': 'RECORD_TYPE_DIRECTORY', '2': 4},
    {'1': 'RECORD_TYPE_VIRTUAL_DIRECTORY', '2': 5},
    {'1': 'RECORD_TYPE_ARCHIVE', '2': 6},
    {'1': 'RECORD_TYPE_VIRTUAL_ARCHIVE', '2': 7},
  ],
};

/// Descriptor for `RecordType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recordTypeDescriptor = $convert.base64Decode(
    'CgpSZWNvcmRUeXBlEhsKF1JFQ09SRF9UWVBFX1VOU1BFQ0lGSUVEEAASFAoQUkVDT1JEX1RZUE'
    'VfUk9PVBABEhQKEFJFQ09SRF9UWVBFX0ZJTEUQAhIcChhSRUNPUkRfVFlQRV9WSVJUVUFMX0ZJ'
    'TEUQAxIZChVSRUNPUkRfVFlQRV9ESVJFQ1RPUlkQBBIhCh1SRUNPUkRfVFlQRV9WSVJUVUFMX0'
    'RJUkVDVE9SWRAFEhcKE1JFQ09SRF9UWVBFX0FSQ0hJVkUQBhIfChtSRUNPUkRfVFlQRV9WSVJU'
    'VUFMX0FSQ0hJVkUQBw==');

@$core.Deprecated('Use getStatusRequestDescriptor instead')
const GetStatusRequest$json = {
  '1': 'GetStatusRequest',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `GetStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStatusRequestDescriptor = $convert.base64Decode(
    'ChBHZXRTdGF0dXNSZXF1ZXN0EhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVz');

@$core.Deprecated('Use getStatusResponseDescriptor instead')
const GetStatusResponse$json = {
  '1': 'GetStatusResponse',
  '2': [
    {'1': 'done', '3': 1, '4': 1, '5': 8, '10': 'done'},
  ],
};

/// Descriptor for `GetStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStatusResponseDescriptor = $convert.base64Decode(
    'ChFHZXRTdGF0dXNSZXNwb25zZRISCgRkb25lGAEgASgIUgRkb25l');

@$core.Deprecated('Use putFilePathRequestDescriptor instead')
const PutFilePathRequest$json = {
  '1': 'PutFilePathRequest',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `PutFilePathRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putFilePathRequestDescriptor = $convert.base64Decode(
    'ChJQdXRGaWxlUGF0aFJlcXVlc3QSEgoEcGF0aBgBIAEoCVIEcGF0aA==');

@$core.Deprecated('Use putFilePathResponseDescriptor instead')
const PutFilePathResponse$json = {
  '1': 'PutFilePathResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `PutFilePathResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putFilePathResponseDescriptor = $convert.base64Decode(
    'ChNQdXRGaWxlUGF0aFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVz');

@$core.Deprecated('Use putJobRequestDescriptor instead')
const PutJobRequest$json = {
  '1': 'PutJobRequest',
  '2': [
    {'1': 'filter', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'filter', '17': true},
    {'1': 'action', '3': 2, '4': 1, '5': 9, '10': 'action'},
  ],
  '8': [
    {'1': '_filter'},
  ],
};

/// Descriptor for `PutJobRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putJobRequestDescriptor = $convert.base64Decode(
    'Cg1QdXRKb2JSZXF1ZXN0EhsKBmZpbHRlchgBIAEoCUgAUgZmaWx0ZXKIAQESFgoGYWN0aW9uGA'
    'IgASgJUgZhY3Rpb25CCQoHX2ZpbHRlcg==');

@$core.Deprecated('Use putJobResponseDescriptor instead')
const PutJobResponse$json = {
  '1': 'PutJobResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `PutJobResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putJobResponseDescriptor = $convert.base64Decode(
    'Cg5QdXRKb2JSZXNwb25zZRIWCgZzdGF0dXMYASABKAVSBnN0YXR1cw==');

@$core.Deprecated('Use listRecordsResponseDescriptor instead')
const ListRecordsResponse$json = {
  '1': 'ListRecordsResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'typ', '3': 2, '4': 1, '5': 14, '6': '.siplicity.v1.RecordType', '10': 'typ'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'children', '3': 4, '4': 3, '5': 11, '6': '.siplicity.v1.ListRecordsResponse', '10': 'children'},
  ],
};

/// Descriptor for `ListRecordsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRecordsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0UmVjb3Jkc1Jlc3BvbnNlEg4KAmlkGAEgASgFUgJpZBIqCgN0eXAYAiABKA4yGC5zaX'
    'BsaWNpdHkudjEuUmVjb3JkVHlwZVIDdHlwEhIKBG5hbWUYAyABKAlSBG5hbWUSPQoIY2hpbGRy'
    'ZW4YBCADKAsyIS5zaXBsaWNpdHkudjEuTGlzdFJlY29yZHNSZXNwb25zZVIIY2hpbGRyZW4=');

@$core.Deprecated('Use listRecordsRequestDescriptor instead')
const ListRecordsRequest$json = {
  '1': 'ListRecordsRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'output', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'output', '17': true},
    {'1': 'display', '3': 3, '4': 1, '5': 11, '6': '.siplicity.v1.GetField', '9': 2, '10': 'display', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_output'},
    {'1': '_display'},
  ],
};

/// Descriptor for `ListRecordsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRecordsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0UmVjb3Jkc1JlcXVlc3QSEwoCaWQYASABKAVIAFICaWSIAQESGwoGb3V0cHV0GAIgAS'
    'gISAFSBm91dHB1dIgBARI1CgdkaXNwbGF5GAMgASgLMhYuc2lwbGljaXR5LnYxLkdldEZpZWxk'
    'SAJSB2Rpc3BsYXmIAQFCBQoDX2lkQgkKB19vdXRwdXRCCgoIX2Rpc3BsYXk=');

@$core.Deprecated('Use getRecordRequestDescriptor instead')
const GetRecordRequest$json = {
  '1': 'GetRecordRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecordRequestDescriptor = $convert.base64Decode(
    'ChBHZXRSZWNvcmRSZXF1ZXN0Eg4KAmlkGAEgASgFUgJpZA==');

@$core.Deprecated('Use getFieldDescriptor instead')
const GetField$json = {
  '1': 'GetField',
  '2': [
    {'1': 'namespace', '3': 1, '4': 1, '5': 9, '10': 'namespace'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFieldDescriptor = $convert.base64Decode(
    'CghHZXRGaWVsZBIcCgluYW1lc3BhY2UYASABKAlSCW5hbWVzcGFjZRISCgRuYW1lGAIgASgJUg'
    'RuYW1l');

@$core.Deprecated('Use fieldDescriptor instead')
const Field$json = {
  '1': 'Field',
  '2': [
    {'1': 'namespace', '3': 1, '4': 1, '5': 9, '10': 'namespace'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Field`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldDescriptor = $convert.base64Decode(
    'CgVGaWVsZBIcCgluYW1lc3BhY2UYASABKAlSCW5hbWVzcGFjZRISCgRuYW1lGAIgASgJUgRuYW'
    '1lEhQKBXZhbHVlGAMgASgJUgV2YWx1ZQ==');

@$core.Deprecated('Use metadataDescriptor instead')
const Metadata$json = {
  '1': 'Metadata',
  '2': [
    {'1': 'field', '3': 1, '4': 1, '5': 11, '6': '.siplicity.v1.Field', '10': 'field'},
    {'1': 'children', '3': 2, '4': 3, '5': 11, '6': '.siplicity.v1.Metadata', '10': 'children'},
  ],
};

/// Descriptor for `Metadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metadataDescriptor = $convert.base64Decode(
    'CghNZXRhZGF0YRIpCgVmaWVsZBgBIAEoCzITLnNpcGxpY2l0eS52MS5GaWVsZFIFZmllbGQSMg'
    'oIY2hpbGRyZW4YAiADKAsyFi5zaXBsaWNpdHkudjEuTWV0YWRhdGFSCGNoaWxkcmVu');

@$core.Deprecated('Use getRecordResponseDescriptor instead')
const GetRecordResponse$json = {
  '1': 'GetRecordResponse',
  '2': [
    {'1': 'typ', '3': 1, '4': 1, '5': 14, '6': '.siplicity.v1.RecordType', '10': 'typ'},
    {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
    {'1': 'metadata', '3': 4, '4': 3, '5': 11, '6': '.siplicity.v1.Metadata', '10': 'metadata'},
  ],
};

/// Descriptor for `GetRecordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecordResponseDescriptor = $convert.base64Decode(
    'ChFHZXRSZWNvcmRSZXNwb25zZRIqCgN0eXAYASABKA4yGC5zaXBsaWNpdHkudjEuUmVjb3JkVH'
    'lwZVIDdHlwEhIKBHBhdGgYAiABKAlSBHBhdGgSEgoEc2l6ZRgDIAEoA1IEc2l6ZRIyCghtZXRh'
    'ZGF0YRgEIAMoCzIWLnNpcGxpY2l0eS52MS5NZXRhZGF0YVIIbWV0YWRhdGE=');

@$core.Deprecated('Use shutdownRequestDescriptor instead')
const ShutdownRequest$json = {
  '1': 'ShutdownRequest',
};

/// Descriptor for `ShutdownRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shutdownRequestDescriptor = $convert.base64Decode(
    'Cg9TaHV0ZG93blJlcXVlc3Q=');

@$core.Deprecated('Use shutdownResponseDescriptor instead')
const ShutdownResponse$json = {
  '1': 'ShutdownResponse',
};

/// Descriptor for `ShutdownResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shutdownResponseDescriptor = $convert.base64Decode(
    'ChBTaHV0ZG93blJlc3BvbnNl');

