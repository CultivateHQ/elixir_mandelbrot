defmodule Sequence do
  @moduledoc """
  Streamable arithmetic sequences
  """

  @spec find_term(integer, number, number) :: number
  def find_term(term_to_find, first_term, common_difference) do
    first_term + (term_to_find - 1) * common_difference
  end

  @spec finite_lazy(pos_integer, number, number) :: Stream.t
  def finite_lazy(num_terms, first_term, last_term) do
    common_difference = common_difference(num_terms, first_term, last_term)
    f = &(Sequence.find_term(&1, first_term, common_difference))
    Stream.map(1..num_terms, f)
  end

  @spec common_difference(pos_integer, number, number) :: number
  defp common_difference(1, first_term, last_term), do: last_term - first_term
  defp common_difference(num_terms, first_term, last_term) do
    (last_term - first_term) / (num_terms - 1)
  end
end
