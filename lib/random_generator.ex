defmodule RandomGenerator do
  alias RandomGenerator.{Titles, Pages}

  def generate_titles(opts \\ []) do
    Titles.get_many_random_titles(
      Keyword.get(opts, :count, 10)
    )
  end

  def generate_pages(opts \\ []) do
    Pages.get_many_random_pages(
      Keyword.get(opts, :count, 10)
    )
  end
end
