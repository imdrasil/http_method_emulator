require "spec"
require "http"
require "../src/http_method_emulator"

def build_form(&block)
  io = IO::Memory.new

  builder = HTTP::FormData::Builder.new(io, "boundary")
  yield(builder)
  builder.finish
  io.to_s
end

def build_context(method = "POST", payload = nil, resource = "/")
  HTTP::Server::Context.new(
    HTTP::Request.new(method, resource, body: payload),
    HTTP::Server::Response.new(IO::Memory.new)
  )
end
