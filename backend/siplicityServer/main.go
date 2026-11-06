//go:build !debug

package main

import (
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
	grpcServer := grpc.NewServer()
	sss := &siplicityServiceServer{srv: grpcServer, store: siplicity.NewMemStore()}
	pb.RegisterSiplicityServiceServer(grpcServer, sss)
	err = grpcServer.Serve(lis)
	if err != nil {
		log.Fatalf("grpc server failure: %v\n", err)
	}
	log.Print("grpc server shutting down\n")
}
