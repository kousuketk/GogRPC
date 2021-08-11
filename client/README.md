# README

### Request, Response
rails cで確認する.
```
> Bakery.bake_pancake(Bakery::Menu::CLASSIC)
D, [2021-08-09T23:46:35.117624 #2555] DEBUG -- : calling 127.0.0.1:50051:/pancake.PancakeBakerService/Bake
 => {:chef_name=>"sample_chefname", :menu=>:CLASSIC, :technical_score=>0.06503831595182419, :create_time=><Google::Protobuf::Timestamp: seconds: 1628520395, nanos: 118648000>} 

> Bakery.report
D, [2021-08-09T23:45:26.747907 #2555] DEBUG -- : calling 127.0.0.1:50051:/pancake.PancakeBakerService/Report
 => {:CLASSIC=>2} 

> ImageUpload.chunked_upload('../sample_pic.jpg')
upload start
sent name = sample_pic.jpg
sent 102400
sent 102400
sent 102400
sent 102400
sent 102400
sent 102400
sent 102400
sent 61457
 => {:uuid=>"7fdc6a7a-34ae-47e8-9728-8a920d3e85b3", :size=>778257, :content_tupe=>"image/jpeg", :filename=>"ImageUpload"} 
```

### others(memo)
```
bundle exec grpc_tools_ruby_protoc -I ../ --ruby_out=app/gen/api/pancake --grpc_out=app/gen/api/pancake ../pancake.proto
```
