# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2025-01-27

### Changed
- **Performance Optimization**: Refactored quotient comparison logic in the Lehmer GCD algorithm
- **Algorithm Enhancement**: Replaced redundant division operations with efficient cross-multiplication comparison
- **Code Quality**: Improved readability and maintainability of the inner loop logic
- **Test Coverage**: Extended randomized testing range from 1 billion to 1 trillion for better stress testing

### Technical Improvements
- Added `same_quotient_without_div/4` helper function for efficient quotient comparison
- Eliminated redundant division operations in the critical path
- Enhanced algorithm performance for very large integers
- Improved mathematical precision using cross-multiplication property

---

## [1.0.0] - 2025-07-21

### Added
- Initial implementation of the Lehmer GCD algorithm
- Main `LehmerGcd.of/2` function with type specifications
- Efficient handling of large integers using matrix operations
- Automatic fallback to BinaryGcd for smaller numbers (< 2^32)
- Comprehensive randomized testing with 1000 test cases
- Integration with BinaryGcd and BitLength dependencies

### Features
- **Lehmer Algorithm Implementation**: Core algorithm using matrix operations for large integers
- **Adaptive Performance**: Automatically chooses optimal algorithm based on input size
- **Type Safety**: Complete type specifications for all public functions
- **Mathematical Precision**: Maintains correctness for very large integers
- **Memory Efficiency**: O(1) additional space complexity

### Documentation
- Comprehensive module documentation with algorithm overview
- Detailed function documentation with examples and edge cases
- Mathematical notation support with LaTeX rendering
- Professional README with usage examples and performance analysis
- API documentation with interactive examples

### Development
- Modern Elixir development tooling setup
- Comprehensive quality assurance with multiple static analysis tools
- Automated testing with randomized validation
- Code formatting and style enforcement
- Spell checking and type checking integration

### Dependencies
- `binary_gcd`: ~> 1.1 - For small number optimization
- `bit_length`: ~> 1.0 - For bit length calculations
- `nstandard`: ~> 0.1 - Development standards
- `ex_doc`: ~> 0.31 - Documentation generation
- `dialyxir`: ~> 1.0 - Type checking
- `credo`: ~> 1.7 - Static analysis
- `spellweaver`: ~> 0.1 - Spell checking

### Configuration
- Credo configuration with custom checks
- Dialyzer configuration with ignore file
- Spell checker configuration with custom words
- Documentation configuration with LaTeX math support
- Project metadata and package configuration

---

## Version History

- **1.0.1**: Performance optimization and enhanced test coverage
- **1.0.0**: First stable release with complete Lehmer GCD implementation

## Contributing

When adding new features or making changes, please:

1. Update this changelog with a new entry
2. Follow the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format
3. Use [Semantic Versioning](https://semver.org/spec/v2.0.0.html) for version numbers
4. Include all notable changes, additions, and fixes

## Release Process

1. Update version in `mix.exs`
2. Update this changelog with release notes
3. Create a git tag for the version
4. Publish to Hex.pm if applicable

---

*This changelog follows the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format and uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html) for version numbers.*

Release version 1.0.1 with performance optimizations and enhanced documentation

This commit prepares the release of version 1.0.1 with the following changes:

Version Update (mix.exs):
- Bumped version from 1.0.0 to 1.0.1 to reflect the performance improvements

Documentation Updates (CHANGELOG.md):
- Added comprehensive changelog entry for version 1.0.1
- Documented performance optimizations in the Lehmer GCD algorithm
- Listed technical improvements including the new same_quotient_without_div/4 function
- Updated version history section to include the new release
- Followed Keep a Changelog format with proper categorization

Key Improvements Documented:
- Performance optimization through refactored quotient comparison logic
- Algorithm enhancement by replacing redundant division operations
- Code quality improvements for better readability and maintainability
- Extended test coverage from 1 billion to 1 trillion for stress testing
- Technical improvements including efficient cross-multiplication comparison

This release focuses on performance optimizations and enhanced test coverage while maintaining backward compatibility and mathematical correctness.
