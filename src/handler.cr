require "http"

module HTTPMethodEmulator
  class Handler
    include HTTP::Handler

    POST_METHOD = "POST"

    INSTANCE = new

    property field : String = "_method"

    def call(context)
      request = context.request
      if request.method == POST_METHOD && (method = request.query_params[field]?)
        request.method = method
      end
      call_next(context)
    end
  end
end
