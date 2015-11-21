defmodule ComplexTest do
  use ExUnit.Case

  test "can be created with a real and imaginary parts" do
    z = Complex.new(1, 2)
    assert z.re == 1
    assert z.im == 2
  end

  test "two can be added together" do
    a = Complex.new(1, 2)
    b = Complex.new(1, 2)
    assert a |> Complex.add(b) == Complex.new(2, 4)
  end
end
