defmodule HelloMix do
  # Import necessary modules
  import Hello.HelloWorld

  @spec main(any()) :: :ok
  def main(_args) do
    # Application logic goes here
    hello()
  end
end
