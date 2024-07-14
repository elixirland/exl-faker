defmodule ExLGenerator.Article do
  @moduledoc false

  @articles {"a", "the"}
  @article_count tuple_size(@articles)
  @default_probability 0.5

  def prepend_random_article(list, opts) do
    probability = Keyword.get(opts, :probability, @default_probability)

    if :rand.uniform() < probability do
      prepend_random_article(list)
    else
      list
    end
  end

  def prepend_random_article(list) do
    [random_article() | list]
  end

  def random_article do
    elem(
      @articles,
      :rand.uniform(@article_count) - 1
    )
  end
end
