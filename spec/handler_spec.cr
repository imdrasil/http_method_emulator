require "./spec_helper"

describe HTTPMethodEmulator::Handler do
  described_class = HTTPMethodEmulator::Handler

  describe "#call" do
    describe "POST" do
      context "without _method" do
        it do
          context = build_context("POST")
          described_class.new.call(context)
          context.request.method.should eq("POST")
        end
      end

      context "with _method in the body" do
        it do
          context = build_context(
            "POST",
            build_form { |f| f.field("_method", "PATCH") }
          )
          described_class.new.call(context)
          context.request.method.should eq("POST")
        end
      end

      context "with _method in the query" do
        it do
          context = build_context("POST", nil, "/?_method=patch")
          described_class.new.call(context)
          context.request.method.should eq("patch")
        end
      end
    end

    describe "GET" do
      context "with _method in the body" do
        it do
          context = build_context(
            "GET",
            build_form { |f| f.field("_method", "PATCH") }
          )
          described_class.new.call(context)
          context.request.method.should eq("GET")
        end
      end

      context "with _method in the query" do
        it do
          context = build_context("GET", nil, "/?_method=patch")
          described_class.new.call(context)
          context.request.method.should eq("GET")
        end
      end
    end
  end
end
