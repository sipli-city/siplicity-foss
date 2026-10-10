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

class Selection extends $pb.GeneratedMessage {
  factory Selection({
    $core.Iterable<$core.int>? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id.addAll(id);
    }
    return $result;
  }
  Selection._() : super();
  factory Selection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Selection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Selection', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Selection clone() => Selection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Selection copyWith(void Function(Selection) updates) => super.copyWith((message) => updates(message as Selection)) as Selection;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Selection create() => Selection._();
  Selection createEmptyInstance() => create();
  static $pb.PbList<Selection> createRepeated() => $pb.PbList<Selection>();
  @$core.pragma('dart2js:noInline')
  static Selection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Selection>(create);
  static Selection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getList(0);
}

class PutJobRequest extends $pb.GeneratedMessage {
  factory PutJobRequest({
    Selection? selection,
    $core.String? query,
    $core.String? action,
  }) {
    final $result = create();
    if (selection != null) {
      $result.selection = selection;
    }
    if (query != null) {
      $result.query = query;
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
    ..aOM<Selection>(1, _omitFieldNames ? '' : 'selection', subBuilder: Selection.create)
    ..aOS(2, _omitFieldNames ? '' : 'query')
    ..aOS(3, _omitFieldNames ? '' : 'action')
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
  Selection get selection => $_getN(0);
  @$pb.TagNumber(1)
  set selection(Selection v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelection() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelection() => clearField(1);
  @$pb.TagNumber(1)
  Selection ensureSelection() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get query => $_getSZ(1);
  @$pb.TagNumber(2)
  set query($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get action => $_getSZ(2);
  @$pb.TagNumber(3)
  set action($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => clearField(3);
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

class CountRecordsRequest extends $pb.GeneratedMessage {
  factory CountRecordsRequest({
    $core.int? id,
    GraphType? graph,
    $core.String? query,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (graph != null) {
      $result.graph = graph;
    }
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  CountRecordsRequest._() : super();
  factory CountRecordsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountRecordsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CountRecordsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..e<GraphType>(2, _omitFieldNames ? '' : 'graph', $pb.PbFieldType.OE, defaultOrMaker: GraphType.GRAPH_TYPE_UNSPECIFIED, valueOf: GraphType.valueOf, enumValues: GraphType.values)
    ..aOS(3, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CountRecordsRequest clone() => CountRecordsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CountRecordsRequest copyWith(void Function(CountRecordsRequest) updates) => super.copyWith((message) => updates(message as CountRecordsRequest)) as CountRecordsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountRecordsRequest create() => CountRecordsRequest._();
  CountRecordsRequest createEmptyInstance() => create();
  static $pb.PbList<CountRecordsRequest> createRepeated() => $pb.PbList<CountRecordsRequest>();
  @$core.pragma('dart2js:noInline')
  static CountRecordsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CountRecordsRequest>(create);
  static CountRecordsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  GraphType get graph => $_getN(1);
  @$pb.TagNumber(2)
  set graph(GraphType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGraph() => $_has(1);
  @$pb.TagNumber(2)
  void clearGraph() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get query => $_getSZ(2);
  @$pb.TagNumber(3)
  set query($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuery() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuery() => clearField(3);
}

class CountRecordsResponse extends $pb.GeneratedMessage {
  factory CountRecordsResponse({
    $core.int? count,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  CountRecordsResponse._() : super();
  factory CountRecordsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountRecordsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CountRecordsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CountRecordsResponse clone() => CountRecordsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CountRecordsResponse copyWith(void Function(CountRecordsResponse) updates) => super.copyWith((message) => updates(message as CountRecordsResponse)) as CountRecordsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountRecordsResponse create() => CountRecordsResponse._();
  CountRecordsResponse createEmptyInstance() => create();
  static $pb.PbList<CountRecordsResponse> createRepeated() => $pb.PbList<CountRecordsResponse>();
  @$core.pragma('dart2js:noInline')
  static CountRecordsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CountRecordsResponse>(create);
  static CountRecordsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class PreparedFeatureCountRequest extends $pb.GeneratedMessage {
  factory PreparedFeatureCountRequest({
    ReportType? report,
    $core.int? max,
  }) {
    final $result = create();
    if (report != null) {
      $result.report = report;
    }
    if (max != null) {
      $result.max = max;
    }
    return $result;
  }
  PreparedFeatureCountRequest._() : super();
  factory PreparedFeatureCountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PreparedFeatureCountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PreparedFeatureCountRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..e<ReportType>(1, _omitFieldNames ? '' : 'report', $pb.PbFieldType.OE, defaultOrMaker: ReportType.REPORT_TYPE_UNSPECIFIED, valueOf: ReportType.valueOf, enumValues: ReportType.values)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'max', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PreparedFeatureCountRequest clone() => PreparedFeatureCountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PreparedFeatureCountRequest copyWith(void Function(PreparedFeatureCountRequest) updates) => super.copyWith((message) => updates(message as PreparedFeatureCountRequest)) as PreparedFeatureCountRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreparedFeatureCountRequest create() => PreparedFeatureCountRequest._();
  PreparedFeatureCountRequest createEmptyInstance() => create();
  static $pb.PbList<PreparedFeatureCountRequest> createRepeated() => $pb.PbList<PreparedFeatureCountRequest>();
  @$core.pragma('dart2js:noInline')
  static PreparedFeatureCountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PreparedFeatureCountRequest>(create);
  static PreparedFeatureCountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ReportType get report => $_getN(0);
  @$pb.TagNumber(1)
  set report(ReportType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReport() => $_has(0);
  @$pb.TagNumber(1)
  void clearReport() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get max => $_getIZ(1);
  @$pb.TagNumber(2)
  set max($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMax() => $_has(1);
  @$pb.TagNumber(2)
  void clearMax() => clearField(2);
}

class PreparedFeatureCountResponse_Feature extends $pb.GeneratedMessage {
  factory PreparedFeatureCountResponse_Feature({
    $core.String? value,
    $core.int? count,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  PreparedFeatureCountResponse_Feature._() : super();
  factory PreparedFeatureCountResponse_Feature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PreparedFeatureCountResponse_Feature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PreparedFeatureCountResponse.Feature', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PreparedFeatureCountResponse_Feature clone() => PreparedFeatureCountResponse_Feature()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PreparedFeatureCountResponse_Feature copyWith(void Function(PreparedFeatureCountResponse_Feature) updates) => super.copyWith((message) => updates(message as PreparedFeatureCountResponse_Feature)) as PreparedFeatureCountResponse_Feature;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreparedFeatureCountResponse_Feature create() => PreparedFeatureCountResponse_Feature._();
  PreparedFeatureCountResponse_Feature createEmptyInstance() => create();
  static $pb.PbList<PreparedFeatureCountResponse_Feature> createRepeated() => $pb.PbList<PreparedFeatureCountResponse_Feature>();
  @$core.pragma('dart2js:noInline')
  static PreparedFeatureCountResponse_Feature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PreparedFeatureCountResponse_Feature>(create);
  static PreparedFeatureCountResponse_Feature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class PreparedFeatureCountResponse extends $pb.GeneratedMessage {
  factory PreparedFeatureCountResponse({
    $core.Iterable<PreparedFeatureCountResponse_Feature>? features,
  }) {
    final $result = create();
    if (features != null) {
      $result.features.addAll(features);
    }
    return $result;
  }
  PreparedFeatureCountResponse._() : super();
  factory PreparedFeatureCountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PreparedFeatureCountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PreparedFeatureCountResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..pc<PreparedFeatureCountResponse_Feature>(1, _omitFieldNames ? '' : 'features', $pb.PbFieldType.PM, subBuilder: PreparedFeatureCountResponse_Feature.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PreparedFeatureCountResponse clone() => PreparedFeatureCountResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PreparedFeatureCountResponse copyWith(void Function(PreparedFeatureCountResponse) updates) => super.copyWith((message) => updates(message as PreparedFeatureCountResponse)) as PreparedFeatureCountResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PreparedFeatureCountResponse create() => PreparedFeatureCountResponse._();
  PreparedFeatureCountResponse createEmptyInstance() => create();
  static $pb.PbList<PreparedFeatureCountResponse> createRepeated() => $pb.PbList<PreparedFeatureCountResponse>();
  @$core.pragma('dart2js:noInline')
  static PreparedFeatureCountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PreparedFeatureCountResponse>(create);
  static PreparedFeatureCountResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PreparedFeatureCountResponse_Feature> get features => $_getList(0);
}

class CountFeaturesRequest extends $pb.GeneratedMessage {
  factory CountFeaturesRequest({
    $core.int? id,
    GraphType? graph,
    FieldPath? feature,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (graph != null) {
      $result.graph = graph;
    }
    if (feature != null) {
      $result.feature = feature;
    }
    return $result;
  }
  CountFeaturesRequest._() : super();
  factory CountFeaturesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountFeaturesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CountFeaturesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..e<GraphType>(2, _omitFieldNames ? '' : 'graph', $pb.PbFieldType.OE, defaultOrMaker: GraphType.GRAPH_TYPE_UNSPECIFIED, valueOf: GraphType.valueOf, enumValues: GraphType.values)
    ..aOM<FieldPath>(3, _omitFieldNames ? '' : 'feature', subBuilder: FieldPath.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CountFeaturesRequest clone() => CountFeaturesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CountFeaturesRequest copyWith(void Function(CountFeaturesRequest) updates) => super.copyWith((message) => updates(message as CountFeaturesRequest)) as CountFeaturesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountFeaturesRequest create() => CountFeaturesRequest._();
  CountFeaturesRequest createEmptyInstance() => create();
  static $pb.PbList<CountFeaturesRequest> createRepeated() => $pb.PbList<CountFeaturesRequest>();
  @$core.pragma('dart2js:noInline')
  static CountFeaturesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CountFeaturesRequest>(create);
  static CountFeaturesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  GraphType get graph => $_getN(1);
  @$pb.TagNumber(2)
  set graph(GraphType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGraph() => $_has(1);
  @$pb.TagNumber(2)
  void clearGraph() => clearField(2);

  @$pb.TagNumber(3)
  FieldPath get feature => $_getN(2);
  @$pb.TagNumber(3)
  set feature(FieldPath v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFeature() => $_has(2);
  @$pb.TagNumber(3)
  void clearFeature() => clearField(3);
  @$pb.TagNumber(3)
  FieldPath ensureFeature() => $_ensure(2);
}

class CountFeaturesResponse_Feature extends $pb.GeneratedMessage {
  factory CountFeaturesResponse_Feature({
    $core.String? value,
    $core.int? count,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  CountFeaturesResponse_Feature._() : super();
  factory CountFeaturesResponse_Feature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountFeaturesResponse_Feature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CountFeaturesResponse.Feature', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CountFeaturesResponse_Feature clone() => CountFeaturesResponse_Feature()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CountFeaturesResponse_Feature copyWith(void Function(CountFeaturesResponse_Feature) updates) => super.copyWith((message) => updates(message as CountFeaturesResponse_Feature)) as CountFeaturesResponse_Feature;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountFeaturesResponse_Feature create() => CountFeaturesResponse_Feature._();
  CountFeaturesResponse_Feature createEmptyInstance() => create();
  static $pb.PbList<CountFeaturesResponse_Feature> createRepeated() => $pb.PbList<CountFeaturesResponse_Feature>();
  @$core.pragma('dart2js:noInline')
  static CountFeaturesResponse_Feature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CountFeaturesResponse_Feature>(create);
  static CountFeaturesResponse_Feature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class CountFeaturesResponse extends $pb.GeneratedMessage {
  factory CountFeaturesResponse({
    $core.Iterable<CountFeaturesResponse_Feature>? features,
  }) {
    final $result = create();
    if (features != null) {
      $result.features.addAll(features);
    }
    return $result;
  }
  CountFeaturesResponse._() : super();
  factory CountFeaturesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CountFeaturesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CountFeaturesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..pc<CountFeaturesResponse_Feature>(1, _omitFieldNames ? '' : 'features', $pb.PbFieldType.PM, subBuilder: CountFeaturesResponse_Feature.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CountFeaturesResponse clone() => CountFeaturesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CountFeaturesResponse copyWith(void Function(CountFeaturesResponse) updates) => super.copyWith((message) => updates(message as CountFeaturesResponse)) as CountFeaturesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountFeaturesResponse create() => CountFeaturesResponse._();
  CountFeaturesResponse createEmptyInstance() => create();
  static $pb.PbList<CountFeaturesResponse> createRepeated() => $pb.PbList<CountFeaturesResponse>();
  @$core.pragma('dart2js:noInline')
  static CountFeaturesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CountFeaturesResponse>(create);
  static CountFeaturesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CountFeaturesResponse_Feature> get features => $_getList(0);
}

class FieldPath_Entry extends $pb.GeneratedMessage {
  factory FieldPath_Entry({
    $core.String? namespace,
    $core.String? name,
    $core.String? value,
    $core.int? index,
    FieldPath_Entry? contains,
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
    if (index != null) {
      $result.index = index;
    }
    if (contains != null) {
      $result.contains = contains;
    }
    return $result;
  }
  FieldPath_Entry._() : super();
  factory FieldPath_Entry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FieldPath_Entry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FieldPath.Entry', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'namespace')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aOM<FieldPath_Entry>(5, _omitFieldNames ? '' : 'contains', subBuilder: FieldPath_Entry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FieldPath_Entry clone() => FieldPath_Entry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FieldPath_Entry copyWith(void Function(FieldPath_Entry) updates) => super.copyWith((message) => updates(message as FieldPath_Entry)) as FieldPath_Entry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldPath_Entry create() => FieldPath_Entry._();
  FieldPath_Entry createEmptyInstance() => create();
  static $pb.PbList<FieldPath_Entry> createRepeated() => $pb.PbList<FieldPath_Entry>();
  @$core.pragma('dart2js:noInline')
  static FieldPath_Entry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldPath_Entry>(create);
  static FieldPath_Entry? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get index => $_getIZ(3);
  @$pb.TagNumber(4)
  set index($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearIndex() => clearField(4);

  @$pb.TagNumber(5)
  FieldPath_Entry get contains => $_getN(4);
  @$pb.TagNumber(5)
  set contains(FieldPath_Entry v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasContains() => $_has(4);
  @$pb.TagNumber(5)
  void clearContains() => clearField(5);
  @$pb.TagNumber(5)
  FieldPath_Entry ensureContains() => $_ensure(4);
}

class FieldPath extends $pb.GeneratedMessage {
  factory FieldPath({
    $core.Iterable<FieldPath_Entry>? entries,
  }) {
    final $result = create();
    if (entries != null) {
      $result.entries.addAll(entries);
    }
    return $result;
  }
  FieldPath._() : super();
  factory FieldPath.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FieldPath.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FieldPath', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..pc<FieldPath_Entry>(1, _omitFieldNames ? '' : 'entries', $pb.PbFieldType.PM, subBuilder: FieldPath_Entry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FieldPath clone() => FieldPath()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FieldPath copyWith(void Function(FieldPath) updates) => super.copyWith((message) => updates(message as FieldPath)) as FieldPath;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FieldPath create() => FieldPath._();
  FieldPath createEmptyInstance() => create();
  static $pb.PbList<FieldPath> createRepeated() => $pb.PbList<FieldPath>();
  @$core.pragma('dart2js:noInline')
  static FieldPath getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FieldPath>(create);
  static FieldPath? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FieldPath_Entry> get entries => $_getList(0);
}

class ListRecordsRequest extends $pb.GeneratedMessage {
  factory ListRecordsRequest({
    $core.int? id,
    GraphType? graph,
    $core.String? query,
    FieldPath? display,
    $core.Iterable<FieldPath>? fields,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (graph != null) {
      $result.graph = graph;
    }
    if (query != null) {
      $result.query = query;
    }
    if (display != null) {
      $result.display = display;
    }
    if (fields != null) {
      $result.fields.addAll(fields);
    }
    return $result;
  }
  ListRecordsRequest._() : super();
  factory ListRecordsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRecordsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRecordsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..e<GraphType>(2, _omitFieldNames ? '' : 'graph', $pb.PbFieldType.OE, defaultOrMaker: GraphType.GRAPH_TYPE_UNSPECIFIED, valueOf: GraphType.valueOf, enumValues: GraphType.values)
    ..aOS(3, _omitFieldNames ? '' : 'query')
    ..aOM<FieldPath>(4, _omitFieldNames ? '' : 'display', subBuilder: FieldPath.create)
    ..pc<FieldPath>(5, _omitFieldNames ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: FieldPath.create)
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
  GraphType get graph => $_getN(1);
  @$pb.TagNumber(2)
  set graph(GraphType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGraph() => $_has(1);
  @$pb.TagNumber(2)
  void clearGraph() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get query => $_getSZ(2);
  @$pb.TagNumber(3)
  set query($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuery() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuery() => clearField(3);

  @$pb.TagNumber(4)
  FieldPath get display => $_getN(3);
  @$pb.TagNumber(4)
  set display(FieldPath v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisplay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplay() => clearField(4);
  @$pb.TagNumber(4)
  FieldPath ensureDisplay() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<FieldPath> get fields => $_getList(4);
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

class ListRecordsResponse extends $pb.GeneratedMessage {
  factory ListRecordsResponse({
    $core.int? id,
    RecordType? typ,
    $core.String? name,
    $core.Iterable<Field>? fields,
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
    if (fields != null) {
      $result.fields.addAll(fields);
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
    ..pc<Field>(4, _omitFieldNames ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: Field.create)
    ..pc<ListRecordsResponse>(5, _omitFieldNames ? '' : 'children', $pb.PbFieldType.PM, subBuilder: ListRecordsResponse.create)
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
  $core.List<Field> get fields => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<ListRecordsResponse> get children => $_getList(4);
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

class Metadata extends $pb.GeneratedMessage {
  factory Metadata({
    Field? field_1,
    $core.Iterable<Metadata>? children,
  }) {
    final $result = create();
    if (field_1 != null) {
      $result.field_1 = field_1;
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
    ..aOM<Field>(1, _omitFieldNames ? '' : 'field', subBuilder: Field.create)
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
  Field get field_1 => $_getN(0);
  @$pb.TagNumber(1)
  set field_1(Field v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasField_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearField_1() => clearField(1);
  @$pb.TagNumber(1)
  Field ensureField_1() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Metadata> get children => $_getList(1);
}

class GetRecordResponse extends $pb.GeneratedMessage {
  factory GetRecordResponse({
    RecordType? typ,
    $core.String? path,
    $fixnum.Int64? size,
    $core.Iterable<Metadata>? metadata,
  }) {
    final $result = create();
    if (typ != null) {
      $result.typ = typ;
    }
    if (path != null) {
      $result.path = path;
    }
    if (size != null) {
      $result.size = size;
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
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..pc<Metadata>(4, _omitFieldNames ? '' : 'metadata', $pb.PbFieldType.PM, subBuilder: Metadata.create)
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
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<Metadata> get metadata => $_getList(3);
}

class PutRecordRequest extends $pb.GeneratedMessage {
  factory PutRecordRequest({
    $core.int? id,
    GraphType? graph,
    GetRecordResponse? record,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (graph != null) {
      $result.graph = graph;
    }
    if (record != null) {
      $result.record = record;
    }
    return $result;
  }
  PutRecordRequest._() : super();
  factory PutRecordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutRecordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PutRecordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..e<GraphType>(2, _omitFieldNames ? '' : 'graph', $pb.PbFieldType.OE, defaultOrMaker: GraphType.GRAPH_TYPE_UNSPECIFIED, valueOf: GraphType.valueOf, enumValues: GraphType.values)
    ..aOM<GetRecordResponse>(3, _omitFieldNames ? '' : 'record', subBuilder: GetRecordResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutRecordRequest clone() => PutRecordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutRecordRequest copyWith(void Function(PutRecordRequest) updates) => super.copyWith((message) => updates(message as PutRecordRequest)) as PutRecordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PutRecordRequest create() => PutRecordRequest._();
  PutRecordRequest createEmptyInstance() => create();
  static $pb.PbList<PutRecordRequest> createRepeated() => $pb.PbList<PutRecordRequest>();
  @$core.pragma('dart2js:noInline')
  static PutRecordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutRecordRequest>(create);
  static PutRecordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  GraphType get graph => $_getN(1);
  @$pb.TagNumber(2)
  set graph(GraphType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGraph() => $_has(1);
  @$pb.TagNumber(2)
  void clearGraph() => clearField(2);

  @$pb.TagNumber(3)
  GetRecordResponse get record => $_getN(2);
  @$pb.TagNumber(3)
  set record(GetRecordResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecord() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecord() => clearField(3);
  @$pb.TagNumber(3)
  GetRecordResponse ensureRecord() => $_ensure(2);
}

class PutRecordResponse extends $pb.GeneratedMessage {
  factory PutRecordResponse({
    $core.int? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  PutRecordResponse._() : super();
  factory PutRecordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutRecordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PutRecordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutRecordResponse clone() => PutRecordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutRecordResponse copyWith(void Function(PutRecordResponse) updates) => super.copyWith((message) => updates(message as PutRecordResponse)) as PutRecordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PutRecordResponse create() => PutRecordResponse._();
  PutRecordResponse createEmptyInstance() => create();
  static $pb.PbList<PutRecordResponse> createRepeated() => $pb.PbList<PutRecordResponse>();
  @$core.pragma('dart2js:noInline')
  static PutRecordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutRecordResponse>(create);
  static PutRecordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class UpdateRecordRequest extends $pb.GeneratedMessage {
  factory UpdateRecordRequest({
    $core.int? id,
    GetRecordResponse? record,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (record != null) {
      $result.record = record;
    }
    return $result;
  }
  UpdateRecordRequest._() : super();
  factory UpdateRecordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRecordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateRecordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<GetRecordResponse>(2, _omitFieldNames ? '' : 'record', subBuilder: GetRecordResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRecordRequest clone() => UpdateRecordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRecordRequest copyWith(void Function(UpdateRecordRequest) updates) => super.copyWith((message) => updates(message as UpdateRecordRequest)) as UpdateRecordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRecordRequest create() => UpdateRecordRequest._();
  UpdateRecordRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateRecordRequest> createRepeated() => $pb.PbList<UpdateRecordRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateRecordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRecordRequest>(create);
  static UpdateRecordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  GetRecordResponse get record => $_getN(1);
  @$pb.TagNumber(2)
  set record(GetRecordResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecord() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecord() => clearField(2);
  @$pb.TagNumber(2)
  GetRecordResponse ensureRecord() => $_ensure(1);
}

class UpdateRecordResponse extends $pb.GeneratedMessage {
  factory UpdateRecordResponse() => create();
  UpdateRecordResponse._() : super();
  factory UpdateRecordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateRecordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateRecordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateRecordResponse clone() => UpdateRecordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateRecordResponse copyWith(void Function(UpdateRecordResponse) updates) => super.copyWith((message) => updates(message as UpdateRecordResponse)) as UpdateRecordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRecordResponse create() => UpdateRecordResponse._();
  UpdateRecordResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateRecordResponse> createRepeated() => $pb.PbList<UpdateRecordResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateRecordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateRecordResponse>(create);
  static UpdateRecordResponse? _defaultInstance;
}

class UpdateFieldRequest extends $pb.GeneratedMessage {
  factory UpdateFieldRequest({
    $core.int? id,
    FieldPath? path,
    $core.bool? overwrite,
    Field? field_4,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (path != null) {
      $result.path = path;
    }
    if (overwrite != null) {
      $result.overwrite = overwrite;
    }
    if (field_4 != null) {
      $result.field_4 = field_4;
    }
    return $result;
  }
  UpdateFieldRequest._() : super();
  factory UpdateFieldRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFieldRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateFieldRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOM<FieldPath>(2, _omitFieldNames ? '' : 'path', subBuilder: FieldPath.create)
    ..aOB(3, _omitFieldNames ? '' : 'overwrite')
    ..aOM<Field>(4, _omitFieldNames ? '' : 'field', subBuilder: Field.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFieldRequest clone() => UpdateFieldRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFieldRequest copyWith(void Function(UpdateFieldRequest) updates) => super.copyWith((message) => updates(message as UpdateFieldRequest)) as UpdateFieldRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateFieldRequest create() => UpdateFieldRequest._();
  UpdateFieldRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateFieldRequest> createRepeated() => $pb.PbList<UpdateFieldRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateFieldRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFieldRequest>(create);
  static UpdateFieldRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  FieldPath get path => $_getN(1);
  @$pb.TagNumber(2)
  set path(FieldPath v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);
  @$pb.TagNumber(2)
  FieldPath ensurePath() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get overwrite => $_getBF(2);
  @$pb.TagNumber(3)
  set overwrite($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOverwrite() => $_has(2);
  @$pb.TagNumber(3)
  void clearOverwrite() => clearField(3);

  @$pb.TagNumber(4)
  Field get field_4 => $_getN(3);
  @$pb.TagNumber(4)
  set field_4(Field v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasField_4() => $_has(3);
  @$pb.TagNumber(4)
  void clearField_4() => clearField(4);
  @$pb.TagNumber(4)
  Field ensureField_4() => $_ensure(3);
}

class UpdateFieldResponse extends $pb.GeneratedMessage {
  factory UpdateFieldResponse() => create();
  UpdateFieldResponse._() : super();
  factory UpdateFieldResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFieldResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateFieldResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFieldResponse clone() => UpdateFieldResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFieldResponse copyWith(void Function(UpdateFieldResponse) updates) => super.copyWith((message) => updates(message as UpdateFieldResponse)) as UpdateFieldResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateFieldResponse create() => UpdateFieldResponse._();
  UpdateFieldResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateFieldResponse> createRepeated() => $pb.PbList<UpdateFieldResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateFieldResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFieldResponse>(create);
  static UpdateFieldResponse? _defaultInstance;
}

class LinkRecordsRequest extends $pb.GeneratedMessage {
  factory LinkRecordsRequest({
    $core.int? id,
    GraphType? graph,
    GraphType? origin,
    $core.bool? shift,
    Selection? records,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (graph != null) {
      $result.graph = graph;
    }
    if (origin != null) {
      $result.origin = origin;
    }
    if (shift != null) {
      $result.shift = shift;
    }
    if (records != null) {
      $result.records = records;
    }
    return $result;
  }
  LinkRecordsRequest._() : super();
  factory LinkRecordsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LinkRecordsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LinkRecordsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..e<GraphType>(2, _omitFieldNames ? '' : 'graph', $pb.PbFieldType.OE, defaultOrMaker: GraphType.GRAPH_TYPE_UNSPECIFIED, valueOf: GraphType.valueOf, enumValues: GraphType.values)
    ..e<GraphType>(3, _omitFieldNames ? '' : 'origin', $pb.PbFieldType.OE, defaultOrMaker: GraphType.GRAPH_TYPE_UNSPECIFIED, valueOf: GraphType.valueOf, enumValues: GraphType.values)
    ..aOB(4, _omitFieldNames ? '' : 'shift')
    ..aOM<Selection>(5, _omitFieldNames ? '' : 'records', subBuilder: Selection.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LinkRecordsRequest clone() => LinkRecordsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LinkRecordsRequest copyWith(void Function(LinkRecordsRequest) updates) => super.copyWith((message) => updates(message as LinkRecordsRequest)) as LinkRecordsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkRecordsRequest create() => LinkRecordsRequest._();
  LinkRecordsRequest createEmptyInstance() => create();
  static $pb.PbList<LinkRecordsRequest> createRepeated() => $pb.PbList<LinkRecordsRequest>();
  @$core.pragma('dart2js:noInline')
  static LinkRecordsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LinkRecordsRequest>(create);
  static LinkRecordsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  GraphType get graph => $_getN(1);
  @$pb.TagNumber(2)
  set graph(GraphType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGraph() => $_has(1);
  @$pb.TagNumber(2)
  void clearGraph() => clearField(2);

  @$pb.TagNumber(3)
  GraphType get origin => $_getN(2);
  @$pb.TagNumber(3)
  set origin(GraphType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrigin() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrigin() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get shift => $_getBF(3);
  @$pb.TagNumber(4)
  set shift($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShift() => $_has(3);
  @$pb.TagNumber(4)
  void clearShift() => clearField(4);

  @$pb.TagNumber(5)
  Selection get records => $_getN(4);
  @$pb.TagNumber(5)
  set records(Selection v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRecords() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecords() => clearField(5);
  @$pb.TagNumber(5)
  Selection ensureRecords() => $_ensure(4);
}

class LinkRecordsResponse extends $pb.GeneratedMessage {
  factory LinkRecordsResponse() => create();
  LinkRecordsResponse._() : super();
  factory LinkRecordsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LinkRecordsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LinkRecordsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LinkRecordsResponse clone() => LinkRecordsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LinkRecordsResponse copyWith(void Function(LinkRecordsResponse) updates) => super.copyWith((message) => updates(message as LinkRecordsResponse)) as LinkRecordsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkRecordsResponse create() => LinkRecordsResponse._();
  LinkRecordsResponse createEmptyInstance() => create();
  static $pb.PbList<LinkRecordsResponse> createRepeated() => $pb.PbList<LinkRecordsResponse>();
  @$core.pragma('dart2js:noInline')
  static LinkRecordsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LinkRecordsResponse>(create);
  static LinkRecordsResponse? _defaultInstance;
}

class UnlinkRecordsRequest extends $pb.GeneratedMessage {
  factory UnlinkRecordsRequest({
    GraphType? graph,
    Selection? records,
  }) {
    final $result = create();
    if (graph != null) {
      $result.graph = graph;
    }
    if (records != null) {
      $result.records = records;
    }
    return $result;
  }
  UnlinkRecordsRequest._() : super();
  factory UnlinkRecordsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnlinkRecordsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnlinkRecordsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..e<GraphType>(1, _omitFieldNames ? '' : 'graph', $pb.PbFieldType.OE, defaultOrMaker: GraphType.GRAPH_TYPE_UNSPECIFIED, valueOf: GraphType.valueOf, enumValues: GraphType.values)
    ..aOM<Selection>(2, _omitFieldNames ? '' : 'records', subBuilder: Selection.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnlinkRecordsRequest clone() => UnlinkRecordsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnlinkRecordsRequest copyWith(void Function(UnlinkRecordsRequest) updates) => super.copyWith((message) => updates(message as UnlinkRecordsRequest)) as UnlinkRecordsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnlinkRecordsRequest create() => UnlinkRecordsRequest._();
  UnlinkRecordsRequest createEmptyInstance() => create();
  static $pb.PbList<UnlinkRecordsRequest> createRepeated() => $pb.PbList<UnlinkRecordsRequest>();
  @$core.pragma('dart2js:noInline')
  static UnlinkRecordsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnlinkRecordsRequest>(create);
  static UnlinkRecordsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  GraphType get graph => $_getN(0);
  @$pb.TagNumber(1)
  set graph(GraphType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGraph() => $_has(0);
  @$pb.TagNumber(1)
  void clearGraph() => clearField(1);

  @$pb.TagNumber(2)
  Selection get records => $_getN(1);
  @$pb.TagNumber(2)
  set records(Selection v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecords() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecords() => clearField(2);
  @$pb.TagNumber(2)
  Selection ensureRecords() => $_ensure(1);
}

class UnlinkRecordsResponse extends $pb.GeneratedMessage {
  factory UnlinkRecordsResponse() => create();
  UnlinkRecordsResponse._() : super();
  factory UnlinkRecordsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnlinkRecordsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnlinkRecordsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnlinkRecordsResponse clone() => UnlinkRecordsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnlinkRecordsResponse copyWith(void Function(UnlinkRecordsResponse) updates) => super.copyWith((message) => updates(message as UnlinkRecordsResponse)) as UnlinkRecordsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnlinkRecordsResponse create() => UnlinkRecordsResponse._();
  UnlinkRecordsResponse createEmptyInstance() => create();
  static $pb.PbList<UnlinkRecordsResponse> createRepeated() => $pb.PbList<UnlinkRecordsResponse>();
  @$core.pragma('dart2js:noInline')
  static UnlinkRecordsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnlinkRecordsResponse>(create);
  static UnlinkRecordsResponse? _defaultInstance;
}

class ShutdownRequest extends $pb.GeneratedMessage {
  factory ShutdownRequest() => create();
  ShutdownRequest._() : super();
  factory ShutdownRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShutdownRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShutdownRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShutdownRequest clone() => ShutdownRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShutdownRequest copyWith(void Function(ShutdownRequest) updates) => super.copyWith((message) => updates(message as ShutdownRequest)) as ShutdownRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShutdownRequest create() => ShutdownRequest._();
  ShutdownRequest createEmptyInstance() => create();
  static $pb.PbList<ShutdownRequest> createRepeated() => $pb.PbList<ShutdownRequest>();
  @$core.pragma('dart2js:noInline')
  static ShutdownRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShutdownRequest>(create);
  static ShutdownRequest? _defaultInstance;
}

class ShutdownResponse extends $pb.GeneratedMessage {
  factory ShutdownResponse() => create();
  ShutdownResponse._() : super();
  factory ShutdownResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShutdownResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShutdownResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'siplicity.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShutdownResponse clone() => ShutdownResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShutdownResponse copyWith(void Function(ShutdownResponse) updates) => super.copyWith((message) => updates(message as ShutdownResponse)) as ShutdownResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShutdownResponse create() => ShutdownResponse._();
  ShutdownResponse createEmptyInstance() => create();
  static $pb.PbList<ShutdownResponse> createRepeated() => $pb.PbList<ShutdownResponse>();
  @$core.pragma('dart2js:noInline')
  static ShutdownResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShutdownResponse>(create);
  static ShutdownResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
