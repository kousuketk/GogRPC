### start server
```
go run server/server.go
```

### grpc_cli
https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md

- Request, Response
```
$ grpc_cli call localhost:50051 pancake.PancakeBakerService.Bake "menu: 1"
connecting to localhost:50051
pancake {
  chef_name: "sample_chefname"
  menu: CLASSIC
  technical_score: 0.226314798
  create_time {
    seconds: 1628516771
    nanos: 279364000
  }
}
Rpc succeeded with OK status

$ grpc_cli call localhost:50051 pancake.PancakeBakerService.Report ""
connecting to localhost:50051
report {
  bake_counts {
    menu: CLASSIC
    count: 2
  }
  bake_counts {
    menu: BACON_AND_CHEESE
    count: 1
  }
}
Rpc succeeded with OK status
```

### others

```
protoc pancake.proto --go_out=.
protoc pancake.proto --go-grpc_out=.
```