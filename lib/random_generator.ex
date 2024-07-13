defmodule RandomGenerator do
  alias RandomGenerator.{Titles, Paragraphs}

  @default_count 10

  @doc """
  Generates a list of random titles.

  ## Returns
  Returns a list of strings.

  ## Options
  - `:count` - The number of titles to generate. Defaults to #{@default_count}.

  ## Examples

      RandomGenerator.generate_titles(count: 3)
      #=> ["1984", "The Lazy Dog", "On the Road"]

  """
  def generate_titles(opts \\ []) do
    Titles.get_many_random_titles(
      Keyword.get(opts, :count, @default_count)
    )
  end

  @doc """
  Generates a list of random pages.

  ## Returns
  Returns a list where each list element is a string containing 5 random paragraphs. Paragraphs are separated by a single newline (`\\n`).

  ## Options
  - `:count` - The number of pages to generate. Defaults to #{@default_count}.

  ## Examples

      RandomGenerator.generate_pages(count: 2)
      #=> ["The forest was alive with the sounds of nature. ...", "Excuse me, are you Amelia Rivers? ..."]

  """

  def generate_pages(opts \\ []) do
    Enum.map(1..Keyword.get(opts, :count, @default_count), fn _ ->
      Paragraphs.concat_random_paragraphs(5)
    end)
  end
end
