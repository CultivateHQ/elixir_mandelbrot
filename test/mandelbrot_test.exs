defmodule MandelbrotTest do
  use ExUnit.Case
  doctest Mandelbrot

  test "#calculate_iterations: calculates iterations for each value in " <>
       "a complex plane" do
    complex_plane = %Geometry.ComplexPlane{re0: -2, im0: -2, re1: 2, im1: 2}
    grid = %Geometry.Rectangle{h: 5, w: 5}
    max_iterations = 10
    result = Mandelbrot.calculate_iterations(complex_plane,
                                             grid,
                                             max_iterations)

    assert Enum.count(result) == 25
    assert List.first(result) == {1, 1, 1}
    assert Enum.at(result, 7) == {2, 3, 10}
    assert List.last(result) == {5, 5, 1}
  end
end
