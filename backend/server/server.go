// Package main implements a simple gRPC server that demonstrates how to use gRPC-Go libraries
// to perform unary, client streaming, server streaming and full duplex RPCs.
//
// It implements the route guide service whose definition can be found in routeguide/route_guide.proto.
package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net"

	"google.golang.org/grpc"

	"github.com/sipli-city/siplicity"

	pb "github.com/sipli-city/siplicity/protogen/siplicityv1"
)

var (
	port = flag.Int("port", 50051, "The server port")
)

type siplicityServiceServer struct {
	pb.UnimplementedSiplicityServiceServer
	srv      *grpc.Server
	store    siplicity.Store
	statuses []bool
}

func (s *siplicityServiceServer) GetStatus(ctx context.Context, in *pb.GetStatusRequest) (*pb.GetStatusResponse, error) {
	var done bool
	if len(s.statuses) > 0 && in.GetStatus() >= 0 && int(in.GetStatus()) < len(s.statuses) {
		done = s.statuses[int(in.GetStatus())]
	}
	return &pb.GetStatusResponse{
		Done: done,
	}, nil
}

func (s *siplicityServiceServer) PutFilePath(ctx context.Context, req *pb.PutFilePathRequest) (*pb.PutFilePathResponse, error) {
	s.statuses = append(s.statuses, false)
	sidx := int32(len(s.statuses) - 1)
	go func() {
		path := req.GetPath()
		if path != "" {
			_ = siplicity.AddPath(path, s.store)
		}
		s.statuses[sidx] = true
	}()
	return &pb.PutFilePathResponse{Status: sidx}, nil
}

func (s *siplicityServiceServer) PutJob(ctx context.Context, in *pb.PutJobRequest) (*pb.PutJobResponse, error) {
	s.statuses = append(s.statuses, false)
	sidx := int32(len(s.statuses) - 1)
	go func() {
		_ = siplicity.Job(in.GetAction(), in.GetQuery(), s.store)
		s.statuses[sidx] = true
	}()
	return &pb.PutJobResponse{Status: sidx}, nil
}

func (s *siplicityServiceServer) CountRecords(ctx context.Context, in *pb.CountRecordsRequest) (*pb.CountRecordsResponse, error) {
	return nil, nil
}

func (s *siplicityServiceServer) CountFeatures(ctx context.Context, in *pb.CountFeaturesRequest) (*pb.CountFeaturesResponse, error) {
	return nil, nil
}

func (s *siplicityServiceServer) PreparedFeatureCount(ctx context.Context, in *pb.PreparedFeatureCountRequest) (*pb.PreparedFeatureCountResponse, error) {
	return s.store.Report(in.GetReport(), in.GetMax()), nil
}

func (s *siplicityServiceServer) ListRecords(ctx context.Context, in *pb.ListRecordsRequest) (*pb.ListRecordsResponse, error) {
	return s.store.ListRecords(in.GetId(), in.GetGraph(), in.GetQuery(), in.GetDisplay(), in.GetFields()), nil
}

func (s *siplicityServiceServer) GetRecord(ctx context.Context, in *pb.GetRecordRequest) (*pb.GetRecordResponse, error) {
	return s.store.Get(in.GetId()), nil
}

func (s *siplicityServiceServer) PutRecord(ctx context.Context, in *pb.PutRecordRequest) (*pb.PutRecordResponse, error) {
	return &pb.PutRecordResponse{Id: s.store.PutChild(in.GetId(), in.GetRecord(), in.GetGraph())}, nil
}

func (s *siplicityServiceServer) UpdateRecord(ctx context.Context, in *pb.UpdateRecordRequest) (*pb.UpdateRecordResponse, error) {
	s.store.UpdateRecord(in.GetId(), in.GetRecord())
	return nil, nil
}

func (s *siplicityServiceServer) UpdateField(ctx context.Context, in *pb.UpdateFieldRequest) (*pb.UpdateFieldResponse, error) {
	s.store.UpdateField(in.GetId(), in.GetPath(), in.GetOverwrite(), in.GetField())
	return nil, nil
}

func (s *siplicityServiceServer) LinkRecords(ctx context.Context, in *pb.LinkRecordsRequest) (*pb.LinkRecordsResponse, error) {
	s.store.LinkRecords(in.GetGraph(), in.GetOrigin(), in.GetId(), in.GetRecords().GetId(), in.GetShift())
	return nil, nil
}

func (s *siplicityServiceServer) UnlinkRecords(ctx context.Context, in *pb.UnlinkRecordsRequest) (*pb.UnlinkRecordsResponse, error) {
	s.store.UnlinkRecords(in.GetGraph(), in.GetRecords().GetId())
	return nil, nil
}

func (s *siplicityServiceServer) Shutdown(ctx context.Context, in *pb.ShutdownRequest) (*pb.ShutdownResponse, error) {
	s.srv.Stop()
	return nil, nil
}

func main() {
	flag.Parse()
	lis, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", *port))
	if err != nil {
		log.Fatalf("grpc server tcp failure: %v\n", err)
	}
	log.Printf("starting grpc server at localhost:%d\n", *port)
	grpcServer := grpc.NewServer()
	sss := &siplicityServiceServer{srv: grpcServer, store: siplicity.NewMemStore()}
	pb.RegisterSiplicityServiceServer(grpcServer, sss)
	err = grpcServer.Serve(lis)
	if err != nil {
		log.Fatalf("grpc server failure: %v\n", err)
	}
	log.Print("grpc server shutting down\n")
}
