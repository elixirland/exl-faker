defmodule ExLFaker.Noun do
  @moduledoc false

  @nouns {
    "bakery",
    "balloon",
    "basket",
    "bicycle",
    "biscuit",
    "bridge",
    "cake",
    "cactus",
    "car",
    "castle",
    "clock",
    "compass",
    "diamond",
    "dinosaur",
    "dog",
    "doll",
    "dragon",
    "drum",
    "feather",
    "fireplace",
    "flower",
    "forest",
    "fountain",
    "galaxy",
    "garage",
    "garden",
    "globe",
    "grape",
    "guitar",
    "hammock",
    "harbor",
    "helmet",
    "hill",
    "horse",
    "house",
    "jacket",
    "jelly",
    "jigsaw",
    "jungle",
    "jar",
    "kangaroo",
    "key",
    "kitchen",
    "kite",
    "koala",
    "ladder",
    "lamp",
    "lantern",
    "leaf",
    "lemon",
    "library",
    "magnet",
    "marble",
    "meadow",
    "mirror",
    "mountain",
    "nest",
    "necktie",
    "noodle",
    "notebook",
    "nut",
    "orchard",
    "parachute",
    "park",
    "pencil",
    "penguin",
    "piano",
    "picture",
    "quicksand",
    "quilt",
    "quiver",
    "rainbow",
    "ribbon",
    "ring",
    "river",
    "robot",
    "sailboat",
    "sculpture",
    "shell",
    "star",
    "submarine",
    "sun",
    "table",
    "teapot",
    "telephone",
    "telescope",
    "train",
    "tree",
    "utensil",
    "vase",
    "violin",
    "village",
    "volcano",
    "vulture",
    "watch",
    "waterfall",
    "whale",
    "window",
    "windmill",
    "xylophone",
    "yard",
    "yarn",
    "yacht",
    "zipper",
    "zoo"
  }
  @noun_count tuple_size(@nouns)
  @default_probability 0.5

  def prepend_random_noun(list, opts) do
    probability = Keyword.get(opts, :probability, @default_probability)

    if :rand.uniform() < probability do
      prepend_random_noun(list)
    else
      list
    end
  end

  def prepend_random_noun(list) do
    [random_noun() | list]
  end

  def random_noun do
    elem(
      @nouns,
      :rand.uniform(@noun_count) - 1
    )
  end
end
