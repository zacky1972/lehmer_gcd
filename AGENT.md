# AGENTS.md

## Project overview

This is an Elixir implementation of the Lehmer GCD algorithm for computing
the greatest common divisor of non-negative integers, especially large integers.

The main public API is:

- `LehmerGcd.of/2`

Keep the public API small unless there is a strong reason to expand it.

## Algorithm decisions

- Preserve the fallback to `BinaryGcd` for smaller inputs.
- Preserve correctness for arbitrary-size non-negative integers.
- The Lehmer path should optimize large integer GCD computation without losing mathematical precision.
- Do not replace the implementation with a direct wrapper around `BinaryGcd.of/2`; `BinaryGcd` is intentionally used as a fallback and test oracle.
- Be careful when changing the inner Lehmer loop. Small algebraic changes can affect correctness.

## Testing

- Run `mix test` after changes.
- For algorithm changes, compare results against `BinaryGcd.of/2`.
- Add or update randomized tests when changing the algorithm.
- Include edge cases involving zero, equal inputs, and very large integers.

## Quality checks

Before considering a change complete, run:

```sh
mix check
```

This project uses formatting, Credo, spell checking, Dialyzer, dependency checks,
and warnings-as-errors as part of the quality gate.

## Documentation and releases

Update documentation when behavior, performance characteristics, or examples change.
Update `CHANGELOG.md` for notable fixes, optimizations, or API changes.
Follow Semantic Versioning for releases.

