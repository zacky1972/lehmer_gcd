# Lehmer gcd

[![Hex.pm](https://img.shields.io/hexpm/v/lehmer_gcd)](https://hex.pm/packages/lehmer_gcd)
[![Hex.pm](https://img.shields.io/hexpm/dt/lehmer_gcd)](https://hex.pm/packages/lehmer_gcd)
[![Hex.pm](https://img.shields.io/hexpm/l/lehmer_gcd)](https://hex.pm/packages/lehmer_gcd)
[![GitHub](https://img.shields.io/github/license/zacky1972/lehmer_gcd)](https://github.com/zacky1972/lehmer_gcd/blob/main/LICENSE.md)

An efficient implementation of the Lehmer GCD algorithm for computing the greatest common divisor of large integers in Elixir.

## Overview

The Lehmer GCD algorithm is particularly efficient for very large integers, using matrix operations to reduce the problem size while maintaining mathematical correctness. For smaller numbers (less than $2^{32}$), it falls back to the Binary GCD algorithm for optimal performance.

### Algorithm Features

- **Efficient for large integers**: Uses matrix operations to reduce problem size
- **Mathematical correctness**: Maintains precision for very large numbers
- **Adaptive performance**: Falls back to Binary GCD for smaller numbers
- **Memory efficient**: $O(1)$ additional space beyond input storage
- **Time complexity**: $O(\log{n})$ for large numbers

## Installation

The package can be installed by adding `lehmer_gcd` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lehmer_gcd, "~> 1.0"}
  ]
end
```

## Usage

### Basic Usage

```elixir
# Simple GCD calculation
LehmerGcd.of(48, 18)
# => 6

# Large number GCD
LehmerGcd.of(123456789, 987654321)
# => 9

# Edge cases
LehmerGcd.of(0, 42)
# => 42

LehmerGcd.of(42, 0)
# => 42
```

### Performance Comparison

The algorithm automatically chooses the most efficient method:

- **Small numbers** (< $2^{32}$): Uses BinaryGcd for optimal performance
- **Large numbers** (≥ $2^{32}$): Uses Lehmer algorithm with matrix operations

## Algorithm Details

The Lehmer algorithm works by:

1. Using the most significant bits of the input numbers to create a smaller problem
2. Solving this smaller problem using matrix operations
3. Using the solution to reduce the original problem size
4. Repeating until the numbers are small enough for direct computation

### Mathematical Foundation

The algorithm uses matrix operations to maintain the mathematical properties of the GCD while working with smaller numbers. This allows it to handle very large integers efficiently without losing precision.

## Documentation

- [API Documentation](https://hexdocs.pm/lehmer_gcd)
- [Changelog](CHANGELOG.md)

## License

Copyright (c) 2025 University of Kitakyushu

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.

