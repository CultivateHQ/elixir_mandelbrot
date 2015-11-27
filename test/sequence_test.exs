defmodule SequenceTest do
  use ExUnit.Case

  test "#find_term: returns the nth term in a sequence" do
    assert Sequence.find_term(1, 0, 1) == 0
    assert Sequence.find_term(2, 0, 1) == 1
    assert Sequence.find_term(3, 0, 1) == 2

    assert Sequence.find_term(1, 1, 1) == 1
    assert Sequence.find_term(2, 1, 1) == 2
    assert Sequence.find_term(3, 1, 1) == 3
  end

  test "#finite_lazy: is a lazy finite sequence with n terms " <>
       "within a defined range" do
    assert Enum.to_list(Sequence.finite_lazy(1, 1, 1)) == [1]
    assert Enum.to_list(Sequence.finite_lazy(2, 1, 2)) == [1, 2]
    assert Enum.to_list(Sequence.finite_lazy(4, 1, 4)) == [1, 2, 3, 4]

    assert Enum.to_list(Sequence.finite_lazy(3, -1.5, 1.5)) == [-1.5, 0.0, 1.5]

    floater = Enum.to_list(Sequence.finite_lazy(16, -1.5, 1.5))
    assert floater |> List.first == -1.5
    assert floater |> List.last == 1.5
    assert floater |> Enum.count == 16

    big_floater = Enum.to_list(Sequence.finite_lazy(800, -1.5, 1.5))
    assert big_floater |> List.first == -1.5
    assert big_floater |> List.last == 1.5
    assert big_floater |> Enum.count == 800
  end
end
