defmodule ComplexTest do
  use ExUnit.Case
  # Calculated by trial and error :(
  @epsilon 1.0e-15

  test "can be created with numbers representing real and imaginary parts" do
    z = Complex.new(1, 2.0)
    assert z.re == 1
    assert z.im == 2
  end

  test "can be created from a 2-tuple of real and imaginary parts" do
    assert Complex.new(1, 2) == Complex.new({1, 2})
  end

  test "cannot be created with non-numeric parts" do
    assert_raise FunctionClauseError, fn ->
      {:not_a_number, 1} |> Complex.new
    end
    assert_raise FunctionClauseError, fn ->
      {1, :not_a_number} |> Complex.new
    end
    assert_raise FunctionClauseError, fn ->
      {:not_a_number, "also not a number"} |> Complex.new
    end
  end

  test "two can be added together" do
    a = Complex.new(1, 2)
    b = Complex.new(1, 2)
    assert a |> Complex.add(b) == Complex.new(2, 4)
  end

  test "two can be subtracted" do
    a = Complex.new(3, 4)
    b = Complex.new(1, 1)
    assert a |> Complex.subtract(b) == Complex.new(2, 3)
  end

  test "can be multiplied" do
    a = Complex.new(2, -7)
    b = Complex.new(3, 2)
    assert a |> Complex.mult(b) == Complex.new(20, -17)
  end

  test "the magnitude can be calculated" do
    assert {1, 1} |> Complex.new |> Complex.mod == :math.sqrt(2)
    assert {-3, 4} |> Complex.new |> Complex.mod == 5

    result = {-1, :math.sqrt(3)} |> Complex.new |> Complex.mod
    assert_in_delta result, 2, @epsilon
  end
end
