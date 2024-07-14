defmodule RandomGenerator.AdverbialPhrase do
  @moduledoc false
  
  # Only adverbial phrases of time and place are included, as they are more likely to make sense when concatenated onto a noun. However, noun + adverbial phrase combinations are still not guaranteed to make sense. That is considered not to be a problem, as the goal is to generate random titles, not meaningful ones.

  @adverbial_phrases {
    # Adverbial Phrases of Time
    "at night", "in the morning", "after dinner", "before the meeting", "during the show", "by noon", "until sunset", "every day", "once a week", "for a few hours",

    # Adverbial Phrases of Place
    "in the garden", "on the roof", "under the table", "beside the river", "at the office", "between the trees", "near the park", "behind the house", "in front of the building", "on the left"
  }
  @adverbial_phrase_count tuple_size(@adverbial_phrases)
  @default_probability 0.5

  def prepend_random_adverbial_phrase(list, opts) do
    probability = Keyword.get(opts, :probability, @default_probability)

    if :rand.uniform() < probability do
      prepend_random_adverbial_phrase(list)
    else
      list
    end
  end

  def prepend_random_adverbial_phrase(list) do
    [random_adverbial_phrase() | list]
  end

  def random_adverbial_phrase do
    elem(
      @adverbial_phrases,
      :rand.uniform(@adverbial_phrase_count - 1)
    )
  end
end
