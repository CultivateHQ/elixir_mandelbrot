defmodule ComplexTest do
  use ExUnit.Case
  # Calculated by trial and error :(
  @epsilon 1.0e-15

  test "can be created with numbers representing real and imaginary parts" do
    z = Complex.new(1, 2.0)
    assert z.re == 1
    assert z.im == 2
  end

  test "cannot be created with non-numeric parts" do
    assert_raise FunctionClauseError, fn ->
      Complex.new(:not_a_number, 1)
    end
    assert_raise FunctionClauseError, fn ->
      Complex.new(1, :not_a_number)
    end
    assert_raise FunctionClauseError, fn ->
      Complex.new(:not_a_number, "also not a number")
    end
  end

  test "two can be added together" do
    a = Complex.new(1, 2)
    b = Complex.new(1, 2)
    assert Complex.add(a, b) == Complex.new(2, 4)
  end

  test "two can be subtracted" do
    a = Complex.new(3, 4)
    b = Complex.new(1, 1)
    assert Complex.subtract(a, b) == Complex.new(2, 3)
  end

  test "can be multiplied" do
    a = Complex.new(2, -7)
    b = Complex.new(3, 2)
    assert Complex.multiply(a, b) == Complex.new(20, -17)
  end

  test "the magnitude can be calculated" do
    assert Complex.new(1, 1) |> Complex.mod == :math.sqrt(2)
    assert Complex.new(-3, 4) |> Complex.mod == 5

    result = Complex.new(-1, :math.sqrt(3)) |> Complex.mod
    assert_in_delta result, 2, @epsilon
  end
end
