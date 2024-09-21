// Package main implements a client for Greeter service.
package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"time"

	pb "github.com/sipli-city/siplicity/gen/siplicityv1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

var (
	addr = flag.String("addr", "localhost:50051", "the address to connect to")
	path = flag.String("path", "", "Path to add")
)

func recurse(resp *pb.ListRecordsResponse) {
	fmt.Println(resp.GetName())
	for _, c := range resp.GetChildren() {
		recurse(c)
	}
}

func main() {
	flag.Parse()
	// Set up a connection to the server.
	conn, err := grpc.NewClient(*addr, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewSiplicityServiceClient(conn)

	// Contact the server and print out its response.
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*30)
	defer cancel()
	resp, err := c.PutFilePath(ctx, &pb.PutFilePathRequest{Path: *path})
	if err != nil {
		log.Fatalf("could not put path: %v", err)
	}
	for {
		time.Sleep(time.Second)
		done, err := c.GetStatus(ctx, &pb.GetStatusRequest{Status: resp.Status})
		if err != nil {
			log.Fatal("could not get status")
		}
		if done.GetDone() {
			break
		}
	}
	r, err := c.ListRecords(ctx, &pb.ListRecordsRequest{})
	if err != nil {
		log.Fatalf("could not list files: %v", err)
	}
	recurse(r)
}
