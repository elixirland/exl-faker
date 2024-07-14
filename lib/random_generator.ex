defmodule ExLFaker do
  @moduledoc """
  A public API for generating random content (e.g., book titles and page content) for Elixirland assignments.

  ## Purpose
  This public API is intended to be used for implementations of Elixirland assignments. It provides a way to generate random content that is required for some of the assignments.
  """

  alias ExLFaker.{Paragraphs}
  import ExLFaker.{Article, Adjective, Noun, AdverbialPhrase}

  @default_count 10

  @doc """
  Generates a list of random titles.

  ## Returns
  Returns a list of strings.

  ## Options
  - `:count` - The number of titles to generate. Defaults to #{@default_count}.

  ## Examples

      ExLFaker.generate_titles(count: 2)
      #=> ["A Detailed Jelly", "Wrong Necktie"]

  """

  def generate_titles(opts \\ []) do
    count = Keyword.get(opts, :count, @default_count)

    for _ <- 1..count, do: build_title()
  end

  defp build_title() do
    []
    |> prepend_random_article(probability: 0.5)
    |> prepend_random_adjective()
    |> prepend_random_noun()
    |> prepend_random_adverbial_phrase(probability: 0.3)
    |> Enum.reverse()
    |> Enum.join(" ")
    |> to_start_case()
  end

  defp to_start_case(binary) do
    binary
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  @doc """
  Generates a list of random pages.

  ## Returns
  Returns a list where each list element is a string containing 5 random paragraphs. Paragraphs are separated by a single newline (`\\n`).

  ## Options
  - `:count` - The number of pages to generate. Defaults to #{@default_count}.

  ## Examples

      ExLFaker.generate_pages(count: 2)
      #=> ["The forest was alive with the sounds of nature. ...", "Excuse me, are you Amelia Rivers? ..."]

  """

  def generate_pages(opts \\ []) do
    Enum.map(1..Keyword.get(opts, :count, @default_count), fn _ ->
      Paragraphs.concat_random_paragraphs(5)
    end)
  end
end
