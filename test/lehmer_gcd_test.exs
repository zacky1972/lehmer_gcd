defmodule LehmerGcdTest do
  use ExUnit.Case
  doctest LehmerGcd

  @max 1_000_000_000_000

  test "randomized test" do
    1..1_000
    |> Enum.map(fn _ -> {:rand.uniform(@max), :rand.uniform(@max)} end)
    |> Enum.map(fn {a, b} ->
      assert LehmerGcd.of(a, b) == BinaryGcd.of(a, b)
    end)
  end
end
