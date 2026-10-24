//go:build debug

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

func main() {
	flag.Parse()
	lis, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", *port))
	if err != nil {
		log.Fatalf("grpc server tcp failure: %v\n", err)
	}
	log.Printf("starting grpc server at localhost:%d\n", *port)
	grpcServer := grpc.NewServer(grpc.UnaryInterceptor(LoggingInterceptor()))
	dsss := &dSiplicityServiceServer{ss: &siplicityServiceServer{srv: grpcServer, store: siplicity.NewMemStore()}}
	pb.RegisterSiplicityServiceServer(grpcServer, dsss)
	err = grpcServer.Serve(lis)
	if err != nil {
		log.Fatalf("grpc server failure: %v\n", err)
	}
	log.Print("grpc server shutting down\n")
}

func LoggingInterceptor() grpc.UnaryServerInterceptor {
	return func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
		log.Printf("Handling gRPC request for method %s", info.FullMethod)
		resp, err := handler(ctx, req)
		log.Printf("Completed gRPC request for method %s", info.FullMethod)
		return resp, err
	}
}

type dSiplicityServiceServer struct {
	pb.UnimplementedSiplicityServiceServer
	ss *siplicityServiceServer
}

func (d *dSiplicityServiceServer) GetStatus(ctx context.Context, in *pb.GetStatusRequest) (*pb.GetStatusResponse, error) {
	log.Printf("Status request for %d\n", in.GetStatus())
	return d.ss.GetStatus(ctx, in)
}

func (d *dSiplicityServiceServer) PutFilePath(ctx context.Context, req *pb.PutFilePathRequest) (*pb.PutFilePathResponse, error) {
	log.Printf("Put file path: %s\n", req.GetPath())
	return d.ss.PutFilePath(ctx, req)
}

func (d *dSiplicityServiceServer) PutJob(ctx context.Context, in *pb.PutJobRequest) (*pb.PutJobResponse, error) {
	log.Printf("Put job: %s (action), %s (query)\n", in.GetAction(), in.GetQuery())
	return d.ss.PutJob(ctx, in)
}

func (d *dSiplicityServiceServer) CountRecords(ctx context.Context, in *pb.CountRecordsRequest) (*pb.CountRecordsResponse, error) {
	log.Printf("Count: %d (id) %d (graph), %s (query), %v (types)", in.GetId(), in.GetGraph(), in.GetQuery(), in.GetTyps())
	return d.ss.CountRecords(ctx, in)
}

func (d *dSiplicityServiceServer) TotalVolume(ctx context.Context, in *pb.TotalVolumeRequest) (*pb.TotalVolumeResponse, error) {
	log.Printf("Volume: %d (id) %d (graph), %s (query)", in.GetId(), in.GetGraph(), in.GetQuery())
	return d.ss.TotalVolume(ctx, in)
}

func (d *dSiplicityServiceServer) CountFeatures(ctx context.Context, in *pb.CountFeaturesRequest) (*pb.CountFeaturesResponse, error) {
	log.Printf("Features: %d (id), %d (graph), %v (feature)", in.GetId(), in.GetGraph(), in.GetFeature())
	return d.ss.CountFeatures(ctx, in)
}

func (d *dSiplicityServiceServer) PreparedFeatureCount(ctx context.Context, in *pb.PreparedFeatureCountRequest) (*pb.PreparedFeatureCountResponse, error) {
	log.Printf("Prepared report %v\n", in.GetReport())
	return d.ss.PreparedFeatureCount(ctx, in)
}

func (d *dSiplicityServiceServer) PreparedFeatureAvailable(ctx context.Context, in *pb.PreparedFeatureAvailableRequest) (*pb.PreparedFeatureAvailableResponse, error) {
	return d.ss.PreparedFeatureAvailable(ctx, in)
}

func (d *dSiplicityServiceServer) ListRecords(ctx context.Context, in *pb.ListRecordsRequest) (*pb.ListRecordsResponse, error) {
	log.Printf("List records: %d (id), %d (graph), %d (page), %d (display), %s (query), %v (typs), %v (fields)", in.GetId(), in.GetGraph(), in.GetPage(), in.GetDisplay(), in.GetQuery(), in.GetTyps(), in.GetFields())
	return d.ss.ListRecords(ctx, in)
}

func (d *dSiplicityServiceServer) GetRecord(ctx context.Context, in *pb.GetRecordRequest) (*pb.GetRecordResponse, error) {
	log.Printf("Get %d\n")
	return d.ss.GetRecord(ctx, in)
}

func (d *dSiplicityServiceServer) PutRecord(ctx context.Context, in *pb.PutRecordRequest) (*pb.PutRecordResponse, error) {
	log.Printf("Put record: %d (id), %d (graph), %v (record)\n", in.GetId(), in.GetGraph(), in.GetRecord())
	return d.ss.PutRecord(ctx, in)
}

func (d *dSiplicityServiceServer) UpdateRecord(ctx context.Context, in *pb.UpdateRecordRequest) (*pb.UpdateRecordResponse, error) {
	log.Printf("Update record: %d (id), %v (record)\n", in.GetId(), in.GetRecord())
	return d.ss.UpdateRecord(ctx, in)
}

func (d *dSiplicityServiceServer) UpdateField(ctx context.Context, in *pb.UpdateFieldRequest) (*pb.UpdateFieldResponse, error) {
	log.Printf("Update field: %d (id), %v (path) %v (overwrite), %v (field)\n", in.GetId(), in.GetPath(), in.GetOverwrite(), in.GetField())
	return d.ss.UpdateField(ctx, in)
}

func (d *dSiplicityServiceServer) LinkRecords(ctx context.Context, in *pb.LinkRecordsRequest) (*pb.LinkRecordsResponse, error) {
	log.Printf("Link request: %d (graph), %d (origin), %d (id), %v (ids), %v (shift)", in.GetGraph(), in.GetOrigin(), in.GetId(), in.GetRecords().GetId(), in.GetShift())
	return d.ss.LinkRecords(ctx, in)
}

func (d *dSiplicityServiceServer) UnlinkRecords(ctx context.Context, in *pb.UnlinkRecordsRequest) (*pb.UnlinkRecordsResponse, error) {
	log.Printf("Unlink request for graph %d for: %v", in.GetGraph(), in.GetRecords().GetId())
	return d.ss.UnlinkRecords(ctx, in)
}

func (d *dSiplicityServiceServer) Shutdown(ctx context.Context, in *pb.ShutdownRequest) (*pb.ShutdownResponse, error) {
	log.Print("SHUTDOWN request\n")
	return d.ss.Shutdown(ctx, in)
}
