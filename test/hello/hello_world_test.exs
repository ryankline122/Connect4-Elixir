defmodule Hello.HelloWorldTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias Hello.HelloWorld

  setup do
    # Any pre-test setup is done here
    :ok
  end

  describe "Hello World" do
    test "should print 'Hello World!!'" do
      output = capture_io(fn ->
        HelloWorld.hello()
      end)
      assert output == "Hello World!!\n"
    end
  end
end
