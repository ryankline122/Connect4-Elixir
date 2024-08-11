defmodule Hello.HelloWorld do
  @spec hello() :: :ok
  def hello(), do: IO.puts("Hello World!!")
end
