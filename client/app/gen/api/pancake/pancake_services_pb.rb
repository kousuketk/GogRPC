# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: pancake.proto for package 'pancake'

require 'grpc'
require 'pancake_pb'

module Pancake
  module PancakeBakerService
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'pancake.PancakeBakerService'

      # メニューを指定して、その焼いたパンケーキを返す
      rpc :Bake, ::Pancake::BakeRequest, ::Pancake::BakeResponse
      # メニューごとに焼いたパンケーキの数を返す
      rpc :Report, ::Pancake::ReportRequest, ::Pancake::ReportResponse
    end

    Stub = Service.rpc_stub_class
  end
end
