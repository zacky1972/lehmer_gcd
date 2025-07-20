defmodule LehmerGcd do
  @moduledoc """
  Implementation of the Lehmer GCD algorithm for computing the greatest common divisor
  of two non-negative integers.

  The Lehmer GCD algorithm is particularly efficient for very large integers, using
  matrix operations to reduce the problem size while maintaining mathematical correctness.
  For smaller numbers (less than $2^{32}$), it falls back to the Binary GCD algorithm for
  optimal performance.

  ## Algorithm Overview

  The Lehmer algorithm works by:
  1. Using the most significant bits of the input numbers to create a smaller problem
  2. Solving this smaller problem using matrix operations
  3. Using the solution to reduce the original problem size
  4. Repeating until the numbers are small enough for direct computation

  ## Examples

      iex> LehmerGcd.of(48, 18)
      6

      iex> LehmerGcd.of(123456789, 987654321)
      9

      iex> LehmerGcd.of(0, 42)
      42

      iex> LehmerGcd.of(42, 0)
      42

  ## Performance

  - For numbers smaller than $2^{32}$: Uses BinaryGcd for optimal performance
  - For larger numbers: Uses Lehmer algorithm with $O(\\log{n})$ complexity
  - Memory usage: $O(1)$ additional space beyond input storage
  """

  @doc """
  Computes the greatest common divisor of two non-negative integers using the Lehmer algorithm.

  ## Parameters

    - `m` - First non-negative integer
    - `n` - Second non-negative integer

  ## Returns

    - The greatest common divisor of `m` and `n`

  ## Examples

      iex> LehmerGcd.of(48, 18)
      6

      iex> LehmerGcd.of(123456789, 987654321)
      9

      iex> LehmerGcd.of(0, 42)
      42

  ## Algorithm Details

  The function delegates to `outer/2` which implements the main Lehmer algorithm logic.
  For numbers smaller than $2^{32}$, it uses BinaryGcd for better performance.
  """
  @spec of(non_neg_integer(), non_neg_integer()) :: non_neg_integer()
  def of(m, n) do
    outer(m, n)
  end

  @doc false
  defp outer(a, 0), do: a
  defp outer(a, b) when b < Bitwise.bsl(1, 32), do: BinaryGcd.of(a, b)

  @doc false
  defp outer(a, b) do
    inner(1, 0, 0, 1, len(a, 32), len(b, 32))
    |> case do
      {_, _, 0, _, _, _} -> outer(b, rem(a, b))
      {x, y, u, v, _, _} -> outer(abs(x * a + y * b), abs(u * a + v * b))
    end
  end

  @doc false
  defp inner(x, y, u, v, a1, b1) when b1 + v == 0 or b1 + y == 0, do: {x, y, u, v, a1, b1}

  @doc false
  defp inner(x, y, u, v, a1, b1) do
    q = div(a1 + x, b1 + v)
    q2 = div(a1 + u, b1 + y)

    if q == q2 do
      inner(u, v, x - q * u, y - q * v, b1, a1 - q * b1)
    else
      {x, y, u, v, a1, b1}
    end
  end

  @doc false
  defp len(a, n), do: Bitwise.bsr(a, BitLength.of(a) - n)
end
