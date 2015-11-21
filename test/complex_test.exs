defmodule ComplexTest do
  use ExUnit.Case

  test "can be created with a real and imaginary parts" do
    z = Complex.new(1, 2)
    assert z.re == 1
    assert z.im == 2
  end
end
