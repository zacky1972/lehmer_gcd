defmodule LehmerGcd do
  @moduledoc """
  Documentation for `LehmerGcd`.
  """

  @spec of(non_neg_integer(), non_neg_integer()) :: non_neg_integer()
  def of(m, n) do
    outer(m, n)
  end

  defp outer(a, 0), do: a
  defp outer(a, b) when b < Bitwise.bsl(1, 32), do: BinaryGcd.of(a, b)

  defp outer(a, b) do
    inner(1, 0, 0, 1, len(a, 32), len(b, 32))
    |> case do
      {_, _, 0, _, _, _} -> outer(b, rem(a, b))
      {x, y, u, v, _, _} -> outer(abs(x * a + y * b), abs(u * a + v * b))
    end
  end

  defp inner(x, y, u, v, a1, b1) when b1 + v == 0 or b1 + y == 0, do: {x, y, u, v, a1, b1}

  defp inner(x, y, u, v, a1, b1) do
    q = div(a1 + x, b1 + v)
    q2 = div(a1 + u, b1 + y)

    if q == q2 do
      inner(u, v, x - q * u, y - q * v, b1, a1 - q * b1)
    else
      {x, y, u, v, a1, b1}
    end
  end

  defp len(a, n), do: Bitwise.bsr(a, BitLength.of(a) - n)
end
