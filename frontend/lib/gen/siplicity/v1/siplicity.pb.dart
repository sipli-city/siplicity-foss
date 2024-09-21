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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'siplicity.pbenum.dart';

export 'siplicity.pbenum.dart';

class GetStatusRequest extends $pb.GeneratedMessage {
  factory GetStatusRequest({
    $core.int? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  GetStatusRequest._() : super();
  factory GetStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStatusRequest clone() => GetStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStatusRequest copyWith(void Function(GetStatusRequest) updates) => super.copyWith((message) => updates(message as GetStatusRequest)) as GetStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStatusRequest create() => GetStatusRequest._();
  GetStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetStatusRequest> createRepeated() => $pb.PbList<GetStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStatusRequest>(create);
  static GetStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class GetStatusResponse extends $pb.GeneratedMessage {
  factory GetStatusResponse({
    $core.bool? done,
  }) {
    final $result = create();
    if (done != null) {
      $result.done = done;
    }
    return $result;
  }
  GetStatusResponse._() : super();
  factory GetStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'done')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStatusResponse clone() => GetStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStatusResponse copyWith(void Function(GetStatusResponse) updates) => super.copyWith((message) => updates(message as GetStatusResponse)) as GetStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStatusResponse create() => GetStatusResponse._();
  GetStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetStatusResponse> createRepeated() => $pb.PbList<GetStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStatusResponse>(create);
  static GetStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get done => $_getBF(0);
  @$pb.TagNumber(1)
  set done($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDone() => $_has(0);
  @$pb.TagNumber(1)
  void clearDone() => clearField(1);
}

class PutFilePathRequest extends $pb.GeneratedMessage {
  factory PutFilePathRequest({
    $core.String? path,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  PutFilePathRequest._() : super();
  factory PutFilePathRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutFilePathRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PutFilePathRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutFilePathRequest clone() => PutFilePathRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutFilePathRequest copyWith(void Function(PutFilePathRequest) updates) => super.copyWith((message) => updates(message as PutFilePathRequest)) as PutFilePathRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PutFilePathRequest create() => PutFilePathRequest._();
  PutFilePathRequest createEmptyInstance() => create();
  static $pb.PbList<PutFilePathRequest> createRepeated() => $pb.PbList<PutFilePathRequest>();
  @$core.pragma('dart2js:noInline')
  static PutFilePathRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutFilePathRequest>(create);
  static PutFilePathRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class PutFilePathResponse extends $pb.GeneratedMessage {
  factory PutFilePathResponse({
    $core.int? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  PutFilePathResponse._() : super();
  factory PutFilePathResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutFilePathResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PutFilePathResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutFilePathResponse clone() => PutFilePathResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutFilePathResponse copyWith(void Function(PutFilePathResponse) updates) => super.copyWith((message) => updates(message as PutFilePathResponse)) as PutFilePathResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PutFilePathResponse create() => PutFilePathResponse._();
  PutFilePathResponse createEmptyInstance() => create();
  static $pb.PbList<PutFilePathResponse> createRepeated() => $pb.PbList<PutFilePathResponse>();
  @$core.pragma('dart2js:noInline')
  static PutFilePathResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutFilePathResponse>(create);
  static PutFilePathResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class PutJobRequest extends $pb.GeneratedMessage {
  factory PutJobRequest({
    $core.String? filter,
    $core.String? action,
  }) {
    final $result = create();
    if (filter != null) {
      $result.filter = filter;
    }
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  PutJobRequest._() : super();
  factory PutJobRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutJobRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PutJobRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filter')
    ..aOS(2, _omitFieldNames ? '' : 'action')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutJobRequest clone() => PutJobRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutJobRequest copyWith(void Function(PutJobRequest) updates) => super.copyWith((message) => updates(message as PutJobRequest)) as PutJobRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PutJobRequest create() => PutJobRequest._();
  PutJobRequest createEmptyInstance() => create();
  static $pb.PbList<PutJobRequest> createRepeated() => $pb.PbList<PutJobRequest>();
  @$core.pragma('dart2js:noInline')
  static PutJobRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutJobRequest>(create);
  static PutJobRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filter => $_getSZ(0);
  @$pb.TagNumber(1)
  set filter($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilter() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get action => $_getSZ(1);
  @$pb.TagNumber(2)
  set action($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAction() => clearField(2);
}

class PutJobResponse extends $pb.GeneratedMessage {
  factory PutJobResponse({
    $core.int? status,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  PutJobResponse._() : super();
  factory PutJobResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutJobResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PutJobResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutJobResponse clone() => PutJobResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutJobResponse copyWith(void Function(PutJobResponse) updates) => super.copyWith((message) => updates(message as PutJobResponse)) as PutJobResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PutJobResponse create() => PutJobResponse._();
  PutJobResponse createEmptyInstance() => create();
  static $pb.PbList<PutJobResponse> createRepeated() => $pb.PbList<PutJobResponse>();
  @$core.pragma('dart2js:noInline')
  static PutJobResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutJobResponse>(create);
  static PutJobResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class ListRecordsResponse extends $pb.GeneratedMessage {
  factory ListRecordsResponse({
    $core.int? id,
    RecordType? typ,
    $core.String? name,
    $core.Iterable<ListRecordsResponse>? children,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (typ != null) {
      $result.typ = typ;
    }
    if (name != null) {
      $result.name = name;
    }
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  ListRecordsResponse._() : super();
  factory ListRecordsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRecordsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRecordsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..e<RecordType>(2, _omitFieldNames ? '' : 'typ', $pb.PbFieldType.OE, defaultOrMaker: RecordType.RECORD_TYPE_UNSPECIFIED, valueOf: RecordType.valueOf, enumValues: RecordType.values)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pc<ListRecordsResponse>(4, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: ListRecordsResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRecordsResponse clone() => ListRecordsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRecordsResponse copyWith(void Function(ListRecordsResponse) updates) => super.copyWith((message) => updates(message as ListRecordsResponse)) as ListRecordsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRecordsResponse create() => ListRecordsResponse._();
  ListRecordsResponse createEmptyInstance() => create();
  static $pb.PbList<ListRecordsResponse> createRepeated() => $pb.PbList<ListRecordsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListRecordsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRecordsResponse>(create);
  static ListRecordsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  RecordType get typ => $_getN(1);
  @$pb.TagNumber(2)
  set typ(RecordType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTyp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTyp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ListRecordsResponse> get children => $_getList(3);
}

class ListRecordsRequest extends $pb.GeneratedMessage {
  factory ListRecordsRequest({
    $core.int? id,
    $core.String? filter,
    $core.bool? output,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (filter != null) {
      $result.filter = filter;
    }
    if (output != null) {
      $result.output = output;
    }
    return $result;
  }
  ListRecordsRequest._() : super();
  factory ListRecordsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRecordsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRecordsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'filter')
    ..aOB(3, _omitFieldNames ? '' : 'output')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRecordsRequest clone() => ListRecordsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRecordsRequest copyWith(void Function(ListRecordsRequest) updates) => super.copyWith((message) => updates(message as ListRecordsRequest)) as ListRecordsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRecordsRequest create() => ListRecordsRequest._();
  ListRecordsRequest createEmptyInstance() => create();
  static $pb.PbList<ListRecordsRequest> createRepeated() => $pb.PbList<ListRecordsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListRecordsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRecordsRequest>(create);
  static ListRecordsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filter => $_getSZ(1);
  @$pb.TagNumber(2)
  set filter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilter() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get output => $_getBF(2);
  @$pb.TagNumber(3)
  set output($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutput() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutput() => clearField(3);
}

class GetRecordRequest extends $pb.GeneratedMessage {
  factory GetRecordRequest({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetRecordRequest._() : super();
  factory GetRecordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRecordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRecordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRecordRequest clone() => GetRecordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRecordRequest copyWith(void Function(GetRecordRequest) updates) => super.copyWith((message) => updates(message as GetRecordRequest)) as GetRecordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecordRequest create() => GetRecordRequest._();
  GetRecordRequest createEmptyInstance() => create();
  static $pb.PbList<GetRecordRequest> createRepeated() => $pb.PbList<GetRecordRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRecordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRecordRequest>(create);
  static GetRecordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Field extends $pb.GeneratedMessage {
  factory Field({
    $core.String? namespace,
    $core.String? name,
    $core.String? value,
  }) {
    final $result = create();
    if (namespace != null) {
      $result.namespace = namespace;
    }
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  Field._() : super();
  factory Field.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Field.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Field', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'namespace')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Field clone() => Field()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Field copyWith(void Function(Field) updates) => super.copyWith((message) => updates(message as Field)) as Field;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Field create() => Field._();
  Field createEmptyInstance() => create();
  static $pb.PbList<Field> createRepeated() => $pb.PbList<Field>();
  @$core.pragma('dart2js:noInline')
  static Field getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Field>(create);
  static Field? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get namespace => $_getSZ(0);
  @$pb.TagNumber(1)
  set namespace($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNamespace() => $_has(0);
  @$pb.TagNumber(1)
  void clearNamespace() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(2);
  @$pb.TagNumber(3)
  set value($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class Metadata extends $pb.GeneratedMessage {
  factory Metadata({
    $core.Iterable<Field>? fields,
    $core.Iterable<Metadata>? children,
  }) {
    final $result = create();
    if (fields != null) {
      $result.fields.addAll(fields);
    }
    if (children != null) {
      $result.children.addAll(children);
    }
    return $result;
  }
  Metadata._() : super();
  factory Metadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Metadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Metadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..pc<Field>(1, _omitFieldNames ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: Field.create)
    ..pc<Metadata>(2, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: Metadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Metadata clone() => Metadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Metadata copyWith(void Function(Metadata) updates) => super.copyWith((message) => updates(message as Metadata)) as Metadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Metadata create() => Metadata._();
  Metadata createEmptyInstance() => create();
  static $pb.PbList<Metadata> createRepeated() => $pb.PbList<Metadata>();
  @$core.pragma('dart2js:noInline')
  static Metadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metadata>(create);
  static Metadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Field> get fields => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Metadata> get children => $_getList(1);
}

class GetRecordResponse extends $pb.GeneratedMessage {
  factory GetRecordResponse({
    RecordType? typ,
    $core.String? name,
    $fixnum.Int64? size,
    $core.String? modtime,
    $core.Iterable<Metadata>? metadata,
  }) {
    final $result = create();
    if (typ != null) {
      $result.typ = typ;
    }
    if (name != null) {
      $result.name = name;
    }
    if (size != null) {
      $result.size = size;
    }
    if (modtime != null) {
      $result.modtime = modtime;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    return $result;
  }
  GetRecordResponse._() : super();
  factory GetRecordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRecordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRecordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..e<RecordType>(1, _omitFieldNames ? '' : 'typ', $pb.PbFieldType.OE, defaultOrMaker: RecordType.RECORD_TYPE_UNSPECIFIED, valueOf: RecordType.valueOf, enumValues: RecordType.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..aOS(4, _omitFieldNames ? '' : 'modtime')
    ..pc<Metadata>(5, _omitFieldNames ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: Metadata.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRecordResponse clone() => GetRecordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRecordResponse copyWith(void Function(GetRecordResponse) updates) => super.copyWith((message) => updates(message as GetRecordResponse)) as GetRecordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecordResponse create() => GetRecordResponse._();
  GetRecordResponse createEmptyInstance() => create();
  static $pb.PbList<GetRecordResponse> createRepeated() => $pb.PbList<GetRecordResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRecordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRecordResponse>(create);
  static GetRecordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  RecordType get typ => $_getN(0);
  @$pb.TagNumber(1)
  set typ(RecordType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTyp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTyp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get modtime => $_getSZ(3);
  @$pb.TagNumber(4)
  set modtime($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModtime() => $_has(3);
  @$pb.TagNumber(4)
  void clearModtime() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<Metadata> get metadata => $_getList(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
