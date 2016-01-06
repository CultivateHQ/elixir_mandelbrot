defmodule Mandelbrot do
  @moduledoc """
  Mandlebrot fractal calculator
  """

  defmodule ComplexPlane do
    defstruct re0: 0, im0: 0, re1: 0, im1: 0
  end

  defmodule Rectangle do
    defstruct h: 0, w: 0
  end

  def generate(complex_plane, grid, max_iterations \\ 10) do
    xs = Sequence.finite_lazy(grid.h, complex_plane.re0, complex_plane.re1)
    ys = Sequence.finite_lazy(grid.w, complex_plane.im0, complex_plane.im1)

    for x <- xs, y <- ys do
      c = Complex.new(x, y)
      iterations = MandelbrotSet.count_iterations(c, max_iterations)
      {c, iterations}
    end
  end

  def test(max_iterations) do
    complex_plane = %ComplexPlane{re0: -2, im0: -2, re1: 2, im1: 2}
    grid = %Rectangle{h: 400, w: 400}
    generate(complex_plane, grid, max_iterations)
  end
end
