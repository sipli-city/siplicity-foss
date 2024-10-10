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

@$core.Deprecated('Use graphTypeDescriptor instead')
const GraphType$json = {
  '1': 'GraphType',
  '2': [
    {'1': 'GRAPH_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'GRAPH_TYPE_INPUT', '2': 1},
    {'1': 'GRAPH_TYPE_OUTPUT', '2': 2},
  ],
};

/// Descriptor for `GraphType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List graphTypeDescriptor = $convert.base64Decode(
    'CglHcmFwaFR5cGUSGgoWR1JBUEhfVFlQRV9VTlNQRUNJRklFRBAAEhQKEEdSQVBIX1RZUEVfSU'
    '5QVVQQARIVChFHUkFQSF9UWVBFX09VVFBVVBAC');

@$core.Deprecated('Use reportTypeDescriptor instead')
const ReportType$json = {
  '1': 'ReportType',
  '2': [
    {'1': 'REPORT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'REPORT_TYPE_EXTENSIONS', '2': 1},
    {'1': 'REPORT_TYPE_MODIFIED', '2': 2},
    {'1': 'REPORT_TYPE_ZERO_BYTE', '2': 3},
    {'1': 'REPORT_TYPE_DUPLICATES', '2': 4},
    {'1': 'REPORT_TYPE_FORMAT_CLASS', '2': 5},
    {'1': 'REPORT_TYPE_MIME_TYPE', '2': 6},
    {'1': 'REPORT_TYPE_FILE_FORMAT', '2': 7},
    {'1': 'REPORT_TYPE_UNKNOWN', '2': 8},
    {'1': 'REPORT_TYPE_MULTIPLE_IDENTIFICATION', '2': 9},
  ],
};

/// Descriptor for `ReportType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportTypeDescriptor = $convert.base64Decode(
    'CgpSZXBvcnRUeXBlEhsKF1JFUE9SVF9UWVBFX1VOU1BFQ0lGSUVEEAASGgoWUkVQT1JUX1RZUE'
    'VfRVhURU5TSU9OUxABEhgKFFJFUE9SVF9UWVBFX01PRElGSUVEEAISGQoVUkVQT1JUX1RZUEVf'
    'WkVST19CWVRFEAMSGgoWUkVQT1JUX1RZUEVfRFVQTElDQVRFUxAEEhwKGFJFUE9SVF9UWVBFX0'
    'ZPUk1BVF9DTEFTUxAFEhkKFVJFUE9SVF9UWVBFX01JTUVfVFlQRRAGEhsKF1JFUE9SVF9UWVBF'
    'X0ZJTEVfRk9STUFUEAcSFwoTUkVQT1JUX1RZUEVfVU5LTk9XThAIEicKI1JFUE9SVF9UWVBFX0'
    '1VTFRJUExFX0lERU5USUZJQ0FUSU9OEAk=');

@$core.Deprecated('Use recordTypeDescriptor instead')
const RecordType$json = {
  '1': 'RecordType',
  '2': [
    {'1': 'RECORD_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'RECORD_TYPE_SCHEMA', '2': 1},
    {'1': 'RECORD_TYPE_ROOT', '2': 2},
    {'1': 'RECORD_TYPE_FILE', '2': 3},
    {'1': 'RECORD_TYPE_VIRTUAL_FILE', '2': 4},
    {'1': 'RECORD_TYPE_DIRECTORY', '2': 5},
    {'1': 'RECORD_TYPE_VIRTUAL_DIRECTORY', '2': 6},
    {'1': 'RECORD_TYPE_ARCHIVE', '2': 7},
    {'1': 'RECORD_TYPE_VIRTUAL_ARCHIVE', '2': 8},
  ],
};

/// Descriptor for `RecordType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recordTypeDescriptor = $convert.base64Decode(
    'CgpSZWNvcmRUeXBlEhsKF1JFQ09SRF9UWVBFX1VOU1BFQ0lGSUVEEAASFgoSUkVDT1JEX1RZUE'
    'VfU0NIRU1BEAESFAoQUkVDT1JEX1RZUEVfUk9PVBACEhQKEFJFQ09SRF9UWVBFX0ZJTEUQAxIc'
    'ChhSRUNPUkRfVFlQRV9WSVJUVUFMX0ZJTEUQBBIZChVSRUNPUkRfVFlQRV9ESVJFQ1RPUlkQBR'
    'IhCh1SRUNPUkRfVFlQRV9WSVJUVUFMX0RJUkVDVE9SWRAGEhcKE1JFQ09SRF9UWVBFX0FSQ0hJ'
    'VkUQBxIfChtSRUNPUkRfVFlQRV9WSVJUVUFMX0FSQ0hJVkUQCA==');

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

@$core.Deprecated('Use selectionDescriptor instead')
const Selection$json = {
  '1': 'Selection',
  '2': [
    {'1': 'id', '3': 1, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `Selection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectionDescriptor = $convert.base64Decode(
    'CglTZWxlY3Rpb24SDgoCaWQYASADKAVSAmlk');

@$core.Deprecated('Use putJobRequestDescriptor instead')
const PutJobRequest$json = {
  '1': 'PutJobRequest',
  '2': [
    {'1': 'selection', '3': 1, '4': 1, '5': 11, '6': '.siplicity.v1.Selection', '9': 0, '10': 'selection', '17': true},
    {'1': 'query', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'query', '17': true},
    {'1': 'action', '3': 3, '4': 1, '5': 9, '10': 'action'},
  ],
  '8': [
    {'1': '_selection'},
    {'1': '_query'},
  ],
};

/// Descriptor for `PutJobRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putJobRequestDescriptor = $convert.base64Decode(
    'Cg1QdXRKb2JSZXF1ZXN0EjoKCXNlbGVjdGlvbhgBIAEoCzIXLnNpcGxpY2l0eS52MS5TZWxlY3'
    'Rpb25IAFIJc2VsZWN0aW9uiAEBEhkKBXF1ZXJ5GAIgASgJSAFSBXF1ZXJ5iAEBEhYKBmFjdGlv'
    'bhgDIAEoCVIGYWN0aW9uQgwKCl9zZWxlY3Rpb25CCAoGX3F1ZXJ5');

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

@$core.Deprecated('Use countRecordsRequestDescriptor instead')
const CountRecordsRequest$json = {
  '1': 'CountRecordsRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'graph', '3': 2, '4': 1, '5': 14, '6': '.siplicity.v1.GraphType', '9': 1, '10': 'graph', '17': true},
    {'1': 'query', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'query', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_graph'},
    {'1': '_query'},
  ],
};

/// Descriptor for `CountRecordsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countRecordsRequestDescriptor = $convert.base64Decode(
    'ChNDb3VudFJlY29yZHNSZXF1ZXN0EhMKAmlkGAEgASgFSABSAmlkiAEBEjIKBWdyYXBoGAIgAS'
    'gOMhcuc2lwbGljaXR5LnYxLkdyYXBoVHlwZUgBUgVncmFwaIgBARIZCgVxdWVyeRgDIAEoCUgC'
    'UgVxdWVyeYgBAUIFCgNfaWRCCAoGX2dyYXBoQggKBl9xdWVyeQ==');

@$core.Deprecated('Use countRecordsResponseDescriptor instead')
const CountRecordsResponse$json = {
  '1': 'CountRecordsResponse',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `CountRecordsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countRecordsResponseDescriptor = $convert.base64Decode(
    'ChRDb3VudFJlY29yZHNSZXNwb25zZRIUCgVjb3VudBgBIAEoBVIFY291bnQ=');

@$core.Deprecated('Use preparedFeatureCountRequestDescriptor instead')
const PreparedFeatureCountRequest$json = {
  '1': 'PreparedFeatureCountRequest',
  '2': [
    {'1': 'report', '3': 1, '4': 1, '5': 14, '6': '.siplicity.v1.ReportType', '10': 'report'},
    {'1': 'max', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'max', '17': true},
  ],
  '8': [
    {'1': '_max'},
  ],
};

/// Descriptor for `PreparedFeatureCountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preparedFeatureCountRequestDescriptor = $convert.base64Decode(
    'ChtQcmVwYXJlZEZlYXR1cmVDb3VudFJlcXVlc3QSMAoGcmVwb3J0GAEgASgOMhguc2lwbGljaX'
    'R5LnYxLlJlcG9ydFR5cGVSBnJlcG9ydBIVCgNtYXgYAiABKAVIAFIDbWF4iAEBQgYKBF9tYXg=');

@$core.Deprecated('Use preparedFeatureCountResponseDescriptor instead')
const PreparedFeatureCountResponse$json = {
  '1': 'PreparedFeatureCountResponse',
  '2': [
    {'1': 'features', '3': 1, '4': 3, '5': 11, '6': '.siplicity.v1.PreparedFeatureCountResponse.Feature', '10': 'features'},
  ],
  '3': [PreparedFeatureCountResponse_Feature$json],
};

@$core.Deprecated('Use preparedFeatureCountResponseDescriptor instead')
const PreparedFeatureCountResponse_Feature$json = {
  '1': 'Feature',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `PreparedFeatureCountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preparedFeatureCountResponseDescriptor = $convert.base64Decode(
    'ChxQcmVwYXJlZEZlYXR1cmVDb3VudFJlc3BvbnNlEk4KCGZlYXR1cmVzGAEgAygLMjIuc2lwbG'
    'ljaXR5LnYxLlByZXBhcmVkRmVhdHVyZUNvdW50UmVzcG9uc2UuRmVhdHVyZVIIZmVhdHVyZXMa'
    'NQoHRmVhdHVyZRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWUSFAoFY291bnQYAiABKAVSBWNvdW50');

@$core.Deprecated('Use countFeaturesRequestDescriptor instead')
const CountFeaturesRequest$json = {
  '1': 'CountFeaturesRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'graph', '3': 2, '4': 1, '5': 14, '6': '.siplicity.v1.GraphType', '9': 1, '10': 'graph', '17': true},
    {'1': 'feature', '3': 3, '4': 1, '5': 11, '6': '.siplicity.v1.FieldPath', '9': 2, '10': 'feature', '17': true},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_graph'},
    {'1': '_feature'},
  ],
};

/// Descriptor for `CountFeaturesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countFeaturesRequestDescriptor = $convert.base64Decode(
    'ChRDb3VudEZlYXR1cmVzUmVxdWVzdBITCgJpZBgBIAEoBUgAUgJpZIgBARIyCgVncmFwaBgCIA'
    'EoDjIXLnNpcGxpY2l0eS52MS5HcmFwaFR5cGVIAVIFZ3JhcGiIAQESNgoHZmVhdHVyZRgDIAEo'
    'CzIXLnNpcGxpY2l0eS52MS5GaWVsZFBhdGhIAlIHZmVhdHVyZYgBAUIFCgNfaWRCCAoGX2dyYX'
    'BoQgoKCF9mZWF0dXJl');

@$core.Deprecated('Use countFeaturesResponseDescriptor instead')
const CountFeaturesResponse$json = {
  '1': 'CountFeaturesResponse',
  '2': [
    {'1': 'features', '3': 1, '4': 3, '5': 11, '6': '.siplicity.v1.CountFeaturesResponse.Feature', '10': 'features'},
  ],
  '3': [CountFeaturesResponse_Feature$json],
};

@$core.Deprecated('Use countFeaturesResponseDescriptor instead')
const CountFeaturesResponse_Feature$json = {
  '1': 'Feature',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `CountFeaturesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countFeaturesResponseDescriptor = $convert.base64Decode(
    'ChVDb3VudEZlYXR1cmVzUmVzcG9uc2USRwoIZmVhdHVyZXMYASADKAsyKy5zaXBsaWNpdHkudj'
    'EuQ291bnRGZWF0dXJlc1Jlc3BvbnNlLkZlYXR1cmVSCGZlYXR1cmVzGjUKB0ZlYXR1cmUSFAoF'
    'dmFsdWUYASABKAlSBXZhbHVlEhQKBWNvdW50GAIgASgFUgVjb3VudA==');

@$core.Deprecated('Use fieldPathDescriptor instead')
const FieldPath$json = {
  '1': 'FieldPath',
  '2': [
    {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.siplicity.v1.FieldPath.Entry', '10': 'entries'},
  ],
  '3': [FieldPath_Entry$json],
};

@$core.Deprecated('Use fieldPathDescriptor instead')
const FieldPath_Entry$json = {
  '1': 'Entry',
  '2': [
    {'1': 'namespace', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'namespace', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'value', '17': true},
    {'1': 'index', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'index', '17': true},
    {'1': 'contains', '3': 5, '4': 1, '5': 11, '6': '.siplicity.v1.FieldPath.Entry', '9': 3, '10': 'contains', '17': true},
  ],
  '8': [
    {'1': '_namespace'},
    {'1': '_value'},
    {'1': '_index'},
    {'1': '_contains'},
  ],
};

/// Descriptor for `FieldPath`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldPathDescriptor = $convert.base64Decode(
    'CglGaWVsZFBhdGgSNwoHZW50cmllcxgBIAMoCzIdLnNpcGxpY2l0eS52MS5GaWVsZFBhdGguRW'
    '50cnlSB2VudHJpZXMa4wEKBUVudHJ5EiEKCW5hbWVzcGFjZRgBIAEoCUgAUgluYW1lc3BhY2WI'
    'AQESEgoEbmFtZRgCIAEoCVIEbmFtZRIZCgV2YWx1ZRgDIAEoCUgBUgV2YWx1ZYgBARIZCgVpbm'
    'RleBgEIAEoBUgCUgVpbmRleIgBARI+Cghjb250YWlucxgFIAEoCzIdLnNpcGxpY2l0eS52MS5G'
    'aWVsZFBhdGguRW50cnlIA1IIY29udGFpbnOIAQFCDAoKX25hbWVzcGFjZUIICgZfdmFsdWVCCA'
    'oGX2luZGV4QgsKCV9jb250YWlucw==');

@$core.Deprecated('Use listRecordsRequestDescriptor instead')
const ListRecordsRequest$json = {
  '1': 'ListRecordsRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'graph', '3': 2, '4': 1, '5': 14, '6': '.siplicity.v1.GraphType', '9': 1, '10': 'graph', '17': true},
    {'1': 'query', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'query', '17': true},
    {'1': 'display', '3': 4, '4': 1, '5': 11, '6': '.siplicity.v1.FieldPath', '9': 3, '10': 'display', '17': true},
    {'1': 'fields', '3': 5, '4': 3, '5': 11, '6': '.siplicity.v1.FieldPath', '10': 'fields'},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_graph'},
    {'1': '_query'},
    {'1': '_display'},
  ],
};

/// Descriptor for `ListRecordsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRecordsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0UmVjb3Jkc1JlcXVlc3QSEwoCaWQYASABKAVIAFICaWSIAQESMgoFZ3JhcGgYAiABKA'
    '4yFy5zaXBsaWNpdHkudjEuR3JhcGhUeXBlSAFSBWdyYXBoiAEBEhkKBXF1ZXJ5GAMgASgJSAJS'
    'BXF1ZXJ5iAEBEjYKB2Rpc3BsYXkYBCABKAsyFy5zaXBsaWNpdHkudjEuRmllbGRQYXRoSANSB2'
    'Rpc3BsYXmIAQESLwoGZmllbGRzGAUgAygLMhcuc2lwbGljaXR5LnYxLkZpZWxkUGF0aFIGZmll'
    'bGRzQgUKA19pZEIICgZfZ3JhcGhCCAoGX3F1ZXJ5QgoKCF9kaXNwbGF5');

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

@$core.Deprecated('Use listRecordsResponseDescriptor instead')
const ListRecordsResponse$json = {
  '1': 'ListRecordsResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'typ', '3': 2, '4': 1, '5': 14, '6': '.siplicity.v1.RecordType', '10': 'typ'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'fields', '3': 4, '4': 3, '5': 11, '6': '.siplicity.v1.Field', '10': 'fields'},
    {'1': 'children', '3': 5, '4': 3, '5': 11, '6': '.siplicity.v1.ListRecordsResponse', '10': 'children'},
  ],
};

/// Descriptor for `ListRecordsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRecordsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0UmVjb3Jkc1Jlc3BvbnNlEg4KAmlkGAEgASgFUgJpZBIqCgN0eXAYAiABKA4yGC5zaX'
    'BsaWNpdHkudjEuUmVjb3JkVHlwZVIDdHlwEhIKBG5hbWUYAyABKAlSBG5hbWUSKwoGZmllbGRz'
    'GAQgAygLMhMuc2lwbGljaXR5LnYxLkZpZWxkUgZmaWVsZHMSPQoIY2hpbGRyZW4YBSADKAsyIS'
    '5zaXBsaWNpdHkudjEuTGlzdFJlY29yZHNSZXNwb25zZVIIY2hpbGRyZW4=');

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

@$core.Deprecated('Use putRecordRequestDescriptor instead')
const PutRecordRequest$json = {
  '1': 'PutRecordRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'graph', '3': 2, '4': 1, '5': 14, '6': '.siplicity.v1.GraphType', '9': 1, '10': 'graph', '17': true},
    {'1': 'record', '3': 3, '4': 1, '5': 11, '6': '.siplicity.v1.GetRecordResponse', '10': 'record'},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_graph'},
  ],
};

/// Descriptor for `PutRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putRecordRequestDescriptor = $convert.base64Decode(
    'ChBQdXRSZWNvcmRSZXF1ZXN0EhMKAmlkGAEgASgFSABSAmlkiAEBEjIKBWdyYXBoGAIgASgOMh'
    'cuc2lwbGljaXR5LnYxLkdyYXBoVHlwZUgBUgVncmFwaIgBARI3CgZyZWNvcmQYAyABKAsyHy5z'
    'aXBsaWNpdHkudjEuR2V0UmVjb3JkUmVzcG9uc2VSBnJlY29yZEIFCgNfaWRCCAoGX2dyYXBo');

@$core.Deprecated('Use putRecordResponseDescriptor instead')
const PutRecordResponse$json = {
  '1': 'PutRecordResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `PutRecordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putRecordResponseDescriptor = $convert.base64Decode(
    'ChFQdXRSZWNvcmRSZXNwb25zZRIOCgJpZBgBIAEoBVICaWQ=');

@$core.Deprecated('Use updateRecordRequestDescriptor instead')
const UpdateRecordRequest$json = {
  '1': 'UpdateRecordRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'record', '3': 2, '4': 1, '5': 11, '6': '.siplicity.v1.GetRecordResponse', '10': 'record'},
  ],
};

/// Descriptor for `UpdateRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRecordRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVSZWNvcmRSZXF1ZXN0Eg4KAmlkGAEgASgFUgJpZBI3CgZyZWNvcmQYAiABKAsyHy'
    '5zaXBsaWNpdHkudjEuR2V0UmVjb3JkUmVzcG9uc2VSBnJlY29yZA==');

@$core.Deprecated('Use updateRecordResponseDescriptor instead')
const UpdateRecordResponse$json = {
  '1': 'UpdateRecordResponse',
};

/// Descriptor for `UpdateRecordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRecordResponseDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVSZWNvcmRSZXNwb25zZQ==');

@$core.Deprecated('Use updateFieldRequestDescriptor instead')
const UpdateFieldRequest$json = {
  '1': 'UpdateFieldRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'path', '3': 2, '4': 1, '5': 11, '6': '.siplicity.v1.FieldPath', '9': 0, '10': 'path', '17': true},
    {'1': 'overwrite', '3': 3, '4': 1, '5': 8, '9': 1, '10': 'overwrite', '17': true},
    {'1': 'field', '3': 4, '4': 1, '5': 11, '6': '.siplicity.v1.Field', '10': 'field'},
  ],
  '8': [
    {'1': '_path'},
    {'1': '_overwrite'},
  ],
};

/// Descriptor for `UpdateFieldRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFieldRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVGaWVsZFJlcXVlc3QSDgoCaWQYASABKAVSAmlkEjAKBHBhdGgYAiABKAsyFy5zaX'
    'BsaWNpdHkudjEuRmllbGRQYXRoSABSBHBhdGiIAQESIQoJb3ZlcndyaXRlGAMgASgISAFSCW92'
    'ZXJ3cml0ZYgBARIpCgVmaWVsZBgEIAEoCzITLnNpcGxpY2l0eS52MS5GaWVsZFIFZmllbGRCBw'
    'oFX3BhdGhCDAoKX292ZXJ3cml0ZQ==');

@$core.Deprecated('Use updateFieldResponseDescriptor instead')
const UpdateFieldResponse$json = {
  '1': 'UpdateFieldResponse',
};

/// Descriptor for `UpdateFieldResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFieldResponseDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVGaWVsZFJlc3BvbnNl');

@$core.Deprecated('Use linkRecordsRequestDescriptor instead')
const LinkRecordsRequest$json = {
  '1': 'LinkRecordsRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'id', '17': true},
    {'1': 'graph', '3': 2, '4': 1, '5': 14, '6': '.siplicity.v1.GraphType', '10': 'graph'},
    {'1': 'origin', '3': 3, '4': 1, '5': 14, '6': '.siplicity.v1.GraphType', '9': 1, '10': 'origin', '17': true},
    {'1': 'shift', '3': 4, '4': 1, '5': 8, '9': 2, '10': 'shift', '17': true},
    {'1': 'records', '3': 5, '4': 1, '5': 11, '6': '.siplicity.v1.Selection', '10': 'records'},
  ],
  '8': [
    {'1': '_id'},
    {'1': '_origin'},
    {'1': '_shift'},
  ],
};

/// Descriptor for `LinkRecordsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkRecordsRequestDescriptor = $convert.base64Decode(
    'ChJMaW5rUmVjb3Jkc1JlcXVlc3QSEwoCaWQYASABKAVIAFICaWSIAQESLQoFZ3JhcGgYAiABKA'
    '4yFy5zaXBsaWNpdHkudjEuR3JhcGhUeXBlUgVncmFwaBI0CgZvcmlnaW4YAyABKA4yFy5zaXBs'
    'aWNpdHkudjEuR3JhcGhUeXBlSAFSBm9yaWdpbogBARIZCgVzaGlmdBgEIAEoCEgCUgVzaGlmdI'
    'gBARIxCgdyZWNvcmRzGAUgASgLMhcuc2lwbGljaXR5LnYxLlNlbGVjdGlvblIHcmVjb3Jkc0IF'
    'CgNfaWRCCQoHX29yaWdpbkIICgZfc2hpZnQ=');

@$core.Deprecated('Use linkRecordsResponseDescriptor instead')
const LinkRecordsResponse$json = {
  '1': 'LinkRecordsResponse',
};

/// Descriptor for `LinkRecordsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkRecordsResponseDescriptor = $convert.base64Decode(
    'ChNMaW5rUmVjb3Jkc1Jlc3BvbnNl');

@$core.Deprecated('Use unlinkRecordsRequestDescriptor instead')
const UnlinkRecordsRequest$json = {
  '1': 'UnlinkRecordsRequest',
  '2': [
    {'1': 'graph', '3': 1, '4': 1, '5': 14, '6': '.siplicity.v1.GraphType', '10': 'graph'},
    {'1': 'records', '3': 2, '4': 1, '5': 11, '6': '.siplicity.v1.Selection', '10': 'records'},
  ],
};

/// Descriptor for `UnlinkRecordsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unlinkRecordsRequestDescriptor = $convert.base64Decode(
    'ChRVbmxpbmtSZWNvcmRzUmVxdWVzdBItCgVncmFwaBgBIAEoDjIXLnNpcGxpY2l0eS52MS5Hcm'
    'FwaFR5cGVSBWdyYXBoEjEKB3JlY29yZHMYAiABKAsyFy5zaXBsaWNpdHkudjEuU2VsZWN0aW9u'
    'UgdyZWNvcmRz');

@$core.Deprecated('Use unlinkRecordsResponseDescriptor instead')
const UnlinkRecordsResponse$json = {
  '1': 'UnlinkRecordsResponse',
};

/// Descriptor for `UnlinkRecordsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unlinkRecordsResponseDescriptor = $convert.base64Decode(
    'ChVVbmxpbmtSZWNvcmRzUmVzcG9uc2U=');

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

