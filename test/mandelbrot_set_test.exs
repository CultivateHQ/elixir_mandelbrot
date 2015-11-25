defmodule MandelbrotSetTest do
  use ExUnit.Case

  test "#apply_polynomial" do
    z = Complex.new(1, 1)
    c = Complex.new(1, 1)
    assert MandelbrotSet.apply_polynomial(z, c) == Complex.new(1, 3)
  end

  test "#iterate_until: iterates until `stop_iterating` returns true" do
    c = Complex.new(1, 1)
    stop_iterating = fn (_z, _iteration_count) -> true end

    assert MandelbrotSet.iterate_until(c, stop_iterating) == 0
    assert MandelbrotSet.iterate_until(c, stop_iterating) == 0
  end

  test "#iterate_until: returns the number of iterations reached" do
    c = Complex.new(1, 1)
    stop_iterating = fn (_z, iteration_count, max_iterations) ->
      iteration_count >= max_iterations
    end
    stop_at_1 = &(stop_iterating.(&1, &2, 1))
    stop_at_2 = &(stop_iterating.(&1, &2, 2))

    assert MandelbrotSet.iterate_until(c, stop_at_1) == 1
    assert MandelbrotSet.iterate_until(c, stop_at_2) == 2
  end
end
