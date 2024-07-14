defmodule RandomGeneratorTest do
  use ExUnit.Case, async: true

  describe "generate_titles/1" do
    test "returns a list of titles as strings" do
      result = RandomGenerator.generate_titles()

      assert is_list(result)
      assert Enum.all?(result, &is_binary/1)
    end

    test "returns the requested number of titles" do
      result = RandomGenerator.generate_titles(count: 5)

      assert length(result) == 5
    end

    test "returns titles that are in start case" do
      result = RandomGenerator.generate_titles(count: 1)

      assert Enum.all?(result, fn title ->
        Enum.all?(
          String.split(title, " "),
          fn word -> word == String.capitalize(word) end
        )
      end)
    end
  end

  describe "generate_pages/1" do
    test "returns a list of pages as strings" do
      result = RandomGenerator.generate_pages()

      assert is_list(result)
      assert Enum.all?(result, &is_binary/1)
    end

    test "returns the requested number of pages" do
      result = RandomGenerator.generate_pages(count: 8)

      assert length(result) == 8
    end

    test "returns pages that contains multiple paragraphs separated by a newline" do
      result = RandomGenerator.generate_pages(count: 1)

      assert Enum.all?(result, fn page ->
        paragraphs = String.split(page, "\n")
        length(paragraphs) == 5
      end)
    end
  end
end
