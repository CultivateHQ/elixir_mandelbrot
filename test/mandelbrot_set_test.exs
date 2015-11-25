defmodule MandelbrotSetTest do
  use ExUnit.Case

  test "#apply_polynomial" do
    z = Complex.new(1, 1)
    c = Complex.new(1, 1)
    assert MandelbrotSet.apply_polynomial(z, c) == Complex.new(1, 3)
  end
end
