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

	pb "github.com/sipli-city/siplicity/gen/siplicityv1"
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

/*
rpc GetStatus(ctx context.Context, in *GetStatusRequest, opts ...grpc.CallOption) (*GetStatusResponse, error)
	PutFilePath(ctx context.Context, in *PutFilePathRequest, opts ...grpc.CallOption) (*PutFilePathResponse, error)
	PutJob(ctx context.Context, in *PutJobRequest, opts ...grpc.CallOption) (*PutJobResponse, error)
	ListRecords(ctx context.Context, in *ListRecordsRequest, opts ...grpc.CallOption) (*ListRecordsResponse, error)
	GetRecord(ctx context.Context, in *GetRecordRequest, opts ...grpc.CallOption) (*GetRecordResponse, error)
*/

func (s *siplicityServiceServer) GetStatus(ctx context.Context, in *pb.GetStatusRequest) (*pb.GetStatusResponse, error) {
	return &pb.GetStatusResponse{
		Done: s.statuses[int(in.GetStatus())],
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
		_ = siplicity.Job(in.GetAction(), in.GetFilter(), s.store)
		s.statuses[sidx] = true
	}()
	return &pb.PutJobResponse{Status: sidx}, nil
}

func (s *siplicityServiceServer) ListRecords(ctx context.Context, in *pb.ListRecordsRequest) (*pb.ListRecordsResponse, error) {
	return s.store.ListRecords(in.GetId(), in.GetOutput()), nil
}

func (s *siplicityServiceServer) GetRecord(ctx context.Context, in *pb.GetRecordRequest) (*pb.GetRecordResponse, error) {
	return s.store.Get(in.GetId()), nil
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
