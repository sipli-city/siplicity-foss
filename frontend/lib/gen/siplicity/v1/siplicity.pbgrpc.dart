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
  static final _$listRecords = $grpc.ClientMethod<$0.ListRecordsRequest, $0.ListRecordsResponse>(
      '/siplicity.v1.SiplicityService/ListRecords',
      ($0.ListRecordsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListRecordsResponse.fromBuffer(value));
  static final _$getRecord = $grpc.ClientMethod<$0.GetRecordRequest, $0.GetRecordResponse>(
      '/siplicity.v1.SiplicityService/GetRecord',
      ($0.GetRecordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRecordResponse.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.ListRecordsResponse> listRecords($0.ListRecordsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRecords, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRecordResponse> getRecord($0.GetRecordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRecord, request, options: options);
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

  $async.Future<$0.ListRecordsResponse> listRecords_Pre($grpc.ServiceCall call, $async.Future<$0.ListRecordsRequest> request) async {
    return listRecords(call, await request);
  }

  $async.Future<$0.GetRecordResponse> getRecord_Pre($grpc.ServiceCall call, $async.Future<$0.GetRecordRequest> request) async {
    return getRecord(call, await request);
  }

  $async.Future<$0.GetStatusResponse> getStatus($grpc.ServiceCall call, $0.GetStatusRequest request);
  $async.Future<$0.PutFilePathResponse> putFilePath($grpc.ServiceCall call, $0.PutFilePathRequest request);
  $async.Future<$0.PutJobResponse> putJob($grpc.ServiceCall call, $0.PutJobRequest request);
  $async.Future<$0.ListRecordsResponse> listRecords($grpc.ServiceCall call, $0.ListRecordsRequest request);
  $async.Future<$0.GetRecordResponse> getRecord($grpc.ServiceCall call, $0.GetRecordRequest request);
}
