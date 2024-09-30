//
//  Generated code. Do not modify.
//  source: siplicity/v1/siplicity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'siplicity.pb.dart' as $0;

export 'siplicity.pb.dart';

@$pb.GrpcServiceName('siplicity.v1.SiplicityService')
class SiplicityServiceClient extends $grpc.Client {
  static final _$getStatus = $grpc.ClientMethod<$0.GetStatusRequest, $0.GetStatusResponse>(
      '/siplicity.v1.SiplicityService/GetStatus',
      ($0.GetStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStatusResponse.fromBuffer(value));
  static final _$putFilePath = $grpc.ClientMethod<$0.PutFilePathRequest, $0.PutFilePathResponse>(
      '/siplicity.v1.SiplicityService/PutFilePath',
      ($0.PutFilePathRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PutFilePathResponse.fromBuffer(value));
  static final _$putJob = $grpc.ClientMethod<$0.PutJobRequest, $0.PutJobResponse>(
      '/siplicity.v1.SiplicityService/PutJob',
      ($0.PutJobRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PutJobResponse.fromBuffer(value));
  static final _$countRecords = $grpc.ClientMethod<$0.CountRecordsRequest, $0.CountRecordsResponse>(
      '/siplicity.v1.SiplicityService/CountRecords',
      ($0.CountRecordsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CountRecordsResponse.fromBuffer(value));
  static final _$listRecords = $grpc.ClientMethod<$0.ListRecordsRequest, $0.ListRecordsResponse>(
      '/siplicity.v1.SiplicityService/ListRecords',
      ($0.ListRecordsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListRecordsResponse.fromBuffer(value));
  static final _$getRecord = $grpc.ClientMethod<$0.GetRecordRequest, $0.GetRecordResponse>(
      '/siplicity.v1.SiplicityService/GetRecord',
      ($0.GetRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRecordResponse.fromBuffer(value));
  static final _$putRecord = $grpc.ClientMethod<$0.PutRecordRequest, $0.PutRecordResponse>(
      '/siplicity.v1.SiplicityService/PutRecord',
      ($0.PutRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PutRecordResponse.fromBuffer(value));
  static final _$updateRecord = $grpc.ClientMethod<$0.UpdateRecordRequest, $0.UpdateRecordResponse>(
      '/siplicity.v1.SiplicityService/UpdateRecord',
      ($0.UpdateRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateRecordResponse.fromBuffer(value));
  static final _$updateField = $grpc.ClientMethod<$0.UpdateFieldRequest, $0.UpdateFieldResponse>(
      '/siplicity.v1.SiplicityService/UpdateField',
      ($0.UpdateFieldRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateFieldResponse.fromBuffer(value));
  static final _$linkRecords = $grpc.ClientMethod<$0.LinkRecordsRequest, $0.LinkRecordsResponse>(
      '/siplicity.v1.SiplicityService/LinkRecords',
      ($0.LinkRecordsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LinkRecordsResponse.fromBuffer(value));
  static final _$unlinkRecords = $grpc.ClientMethod<$0.UnlinkRecordsRequest, $0.UnlinkRecordsResponse>(
      '/siplicity.v1.SiplicityService/UnlinkRecords',
      ($0.UnlinkRecordsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UnlinkRecordsResponse.fromBuffer(value));
  static final _$commit = $grpc.ClientMethod<$0.CommitRequest, $0.CommitResponse>(
      '/siplicity.v1.SiplicityService/Commit',
      ($0.CommitRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CommitResponse.fromBuffer(value));
  static final _$shutdown = $grpc.ClientMethod<$0.ShutdownRequest, $0.ShutdownResponse>(
      '/siplicity.v1.SiplicityService/Shutdown',
      ($0.ShutdownRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ShutdownResponse.fromBuffer(value));

  SiplicityServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetStatusResponse> getStatus($0.GetStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.PutFilePathResponse> putFilePath($0.PutFilePathRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$putFilePath, request, options: options);
  }

  $grpc.ResponseFuture<$0.PutJobResponse> putJob($0.PutJobRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$putJob, request, options: options);
  }

  $grpc.ResponseFuture<$0.CountRecordsResponse> countRecords($0.CountRecordsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$countRecords, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListRecordsResponse> listRecords($0.ListRecordsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRecords, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRecordResponse> getRecord($0.GetRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRecord, request, options: options);
  }

  $grpc.ResponseFuture<$0.PutRecordResponse> putRecord($0.PutRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$putRecord, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateRecordResponse> updateRecord($0.UpdateRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateRecord, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateFieldResponse> updateField($0.UpdateFieldRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateField, request, options: options);
  }

  $grpc.ResponseFuture<$0.LinkRecordsResponse> linkRecords($0.LinkRecordsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$linkRecords, request, options: options);
  }

  $grpc.ResponseFuture<$0.UnlinkRecordsResponse> unlinkRecords($0.UnlinkRecordsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unlinkRecords, request, options: options);
  }

  $grpc.ResponseFuture<$0.CommitResponse> commit($0.CommitRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$commit, request, options: options);
  }

  $grpc.ResponseFuture<$0.ShutdownResponse> shutdown($0.ShutdownRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$shutdown, request, options: options);
  }
}

@$pb.GrpcServiceName('siplicity.v1.SiplicityService')
abstract class SiplicityServiceBase extends $grpc.Service {
  $core.String get $name => 'siplicity.v1.SiplicityService';

  SiplicityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetStatusRequest, $0.GetStatusResponse>(
        'GetStatus',
        getStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStatusRequest.fromBuffer(value),
        ($0.GetStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PutFilePathRequest, $0.PutFilePathResponse>(
        'PutFilePath',
        putFilePath_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PutFilePathRequest.fromBuffer(value),
        ($0.PutFilePathResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PutJobRequest, $0.PutJobResponse>(
        'PutJob',
        putJob_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PutJobRequest.fromBuffer(value),
        ($0.PutJobResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CountRecordsRequest, $0.CountRecordsResponse>(
        'CountRecords',
        countRecords_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CountRecordsRequest.fromBuffer(value),
        ($0.CountRecordsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListRecordsRequest, $0.ListRecordsResponse>(
        'ListRecords',
        listRecords_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListRecordsRequest.fromBuffer(value),
        ($0.ListRecordsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRecordRequest, $0.GetRecordResponse>(
        'GetRecord',
        getRecord_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRecordRequest.fromBuffer(value),
        ($0.GetRecordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PutRecordRequest, $0.PutRecordResponse>(
        'PutRecord',
        putRecord_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PutRecordRequest.fromBuffer(value),
        ($0.PutRecordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateRecordRequest, $0.UpdateRecordResponse>(
        'UpdateRecord',
        updateRecord_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateRecordRequest.fromBuffer(value),
        ($0.UpdateRecordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateFieldRequest, $0.UpdateFieldResponse>(
        'UpdateField',
        updateField_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateFieldRequest.fromBuffer(value),
        ($0.UpdateFieldResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LinkRecordsRequest, $0.LinkRecordsResponse>(
        'LinkRecords',
        linkRecords_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LinkRecordsRequest.fromBuffer(value),
        ($0.LinkRecordsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UnlinkRecordsRequest, $0.UnlinkRecordsResponse>(
        'UnlinkRecords',
        unlinkRecords_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UnlinkRecordsRequest.fromBuffer(value),
        ($0.UnlinkRecordsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CommitRequest, $0.CommitResponse>(
        'Commit',
        commit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CommitRequest.fromBuffer(value),
        ($0.CommitResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ShutdownRequest, $0.ShutdownResponse>(
        'Shutdown',
        shutdown_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ShutdownRequest.fromBuffer(value),
        ($0.ShutdownResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetStatusResponse> getStatus_Pre($grpc.ServiceCall call, $async.Future<$0.GetStatusRequest> request) async {
    return getStatus(call, await request);
  }

  $async.Future<$0.PutFilePathResponse> putFilePath_Pre($grpc.ServiceCall call, $async.Future<$0.PutFilePathRequest> request) async {
    return putFilePath(call, await request);
  }

  $async.Future<$0.PutJobResponse> putJob_Pre($grpc.ServiceCall call, $async.Future<$0.PutJobRequest> request) async {
    return putJob(call, await request);
  }

  $async.Future<$0.CountRecordsResponse> countRecords_Pre($grpc.ServiceCall call, $async.Future<$0.CountRecordsRequest> request) async {
    return countRecords(call, await request);
  }

  $async.Future<$0.ListRecordsResponse> listRecords_Pre($grpc.ServiceCall call, $async.Future<$0.ListRecordsRequest> request) async {
    return listRecords(call, await request);
  }

  $async.Future<$0.GetRecordResponse> getRecord_Pre($grpc.ServiceCall call, $async.Future<$0.GetRecordRequest> request) async {
    return getRecord(call, await request);
  }

  $async.Future<$0.PutRecordResponse> putRecord_Pre($grpc.ServiceCall call, $async.Future<$0.PutRecordRequest> request) async {
    return putRecord(call, await request);
  }

  $async.Future<$0.UpdateRecordResponse> updateRecord_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateRecordRequest> request) async {
    return updateRecord(call, await request);
  }

  $async.Future<$0.UpdateFieldResponse> updateField_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateFieldRequest> request) async {
    return updateField(call, await request);
  }

  $async.Future<$0.LinkRecordsResponse> linkRecords_Pre($grpc.ServiceCall call, $async.Future<$0.LinkRecordsRequest> request) async {
    return linkRecords(call, await request);
  }

  $async.Future<$0.UnlinkRecordsResponse> unlinkRecords_Pre($grpc.ServiceCall call, $async.Future<$0.UnlinkRecordsRequest> request) async {
    return unlinkRecords(call, await request);
  }

  $async.Future<$0.CommitResponse> commit_Pre($grpc.ServiceCall call, $async.Future<$0.CommitRequest> request) async {
    return commit(call, await request);
  }

  $async.Future<$0.ShutdownResponse> shutdown_Pre($grpc.ServiceCall call, $async.Future<$0.ShutdownRequest> request) async {
    return shutdown(call, await request);
  }

  $async.Future<$0.GetStatusResponse> getStatus($grpc.ServiceCall call, $0.GetStatusRequest request);
  $async.Future<$0.PutFilePathResponse> putFilePath($grpc.ServiceCall call, $0.PutFilePathRequest request);
  $async.Future<$0.PutJobResponse> putJob($grpc.ServiceCall call, $0.PutJobRequest request);
  $async.Future<$0.CountRecordsResponse> countRecords($grpc.ServiceCall call, $0.CountRecordsRequest request);
  $async.Future<$0.ListRecordsResponse> listRecords($grpc.ServiceCall call, $0.ListRecordsRequest request);
  $async.Future<$0.GetRecordResponse> getRecord($grpc.ServiceCall call, $0.GetRecordRequest request);
  $async.Future<$0.PutRecordResponse> putRecord($grpc.ServiceCall call, $0.PutRecordRequest request);
  $async.Future<$0.UpdateRecordResponse> updateRecord($grpc.ServiceCall call, $0.UpdateRecordRequest request);
  $async.Future<$0.UpdateFieldResponse> updateField($grpc.ServiceCall call, $0.UpdateFieldRequest request);
  $async.Future<$0.LinkRecordsResponse> linkRecords($grpc.ServiceCall call, $0.LinkRecordsRequest request);
  $async.Future<$0.UnlinkRecordsResponse> unlinkRecords($grpc.ServiceCall call, $0.UnlinkRecordsRequest request);
  $async.Future<$0.CommitResponse> commit($grpc.ServiceCall call, $0.CommitRequest request);
  $async.Future<$0.ShutdownResponse> shutdown($grpc.ServiceCall call, $0.ShutdownRequest request);
}
