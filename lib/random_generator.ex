defmodule RandomGenerator do
  alias RandomGenerator.{Titles, Pages}

  @default_count 10

  def generate_titles(opts \\ []) do
    Titles.get_many_random_titles(
      Keyword.get(opts, :count, @default_count)
    )
  end

  def generate_pages(opts \\ []) do
    Pages.get_many_random_pages(
      Keyword.get(opts, :count, @default_count)
    )
  end
end
