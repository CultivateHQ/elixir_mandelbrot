defmodule Sequence do
  @moduledoc """
  Streamable arithmetic sequences
  """

  def find_term(term_to_find, first_term, common_difference) do
    first_term + (term_to_find - 1) * common_difference
  end

  def finite_lazy(num_terms, first_term, last_term) do
    common_difference = common_difference(num_terms, first_term, last_term)
    f = &(Sequence.find_term(&1, first_term, common_difference))
    Stream.map(1..num_terms, f)
  end

  defp common_difference(1, first_term, last_term), do: last_term - first_term
  defp common_difference(num_terms, first_term, last_term) do
    (last_term - first_term) / (num_terms - 1)
  end
end
