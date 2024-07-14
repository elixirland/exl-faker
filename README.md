# ExL Faker
This package allows users to generates random data (e.g., book titles and page texts) that they can use in their implementations of Elixirland assignments.

Read more about Elixirland at https://github.com/elixirland.

## Public API
The public API if this package is contained in the `ExLFaker` module. It exposes a collection of functions that generate a variety of content.

### Examples

```
ExLFaker.generate_titles(count: 4000)
#=> ["Third Lamp", "A Polite Kite", ...]

ExLFaker.generate_pages(count: 10)
#=> ["As she worked, Emily thought" ..., ...]
```
