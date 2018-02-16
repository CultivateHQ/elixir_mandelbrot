defmodule Mandelbrot do
  @moduledoc """
  Mandlebrot fractal calculator
  """
  alias Geometry.ComplexPlane
  alias Geometry.Rectangle

  @doc """
  For each point in `complex_plane` mapped onto the rectangular `grid`,
  calculates the number of iterations needed to disprove Mandelbrot set
  membership.

  `max_iterations` limits how many iterations will be attempted, and thus will
  be the maximum number returned for those numbers whose membership cannot be
  disproven. I.e. these numbers *are* members of the Mandelbrot set.
  """
  @spec calculate_iterations(ComplexPlane.t, Rectangle.t, pos_integer)
    :: [{pos_integer, pos_integer, MandelbrotSet.iteration_count}]
  def calculate_iterations(complex_plane, grid, max_iterations \\ 10) do
    xs = Sequence.finite_lazy(grid.h, complex_plane.re0, complex_plane.re1)
    ys = Sequence.finite_lazy(grid.w, complex_plane.im0, complex_plane.im1)

    for {x, re} <- xs, {y, im} <- ys do
      c = Complex.new(re, im)
      iterations = MandelbrotSet.count_iterations(c, max_iterations)
      {x, y, iterations}
    end
  end

  @doc false
  # Temporary manual test driver.
  def test(max_iterations) do
    complex_plane = %ComplexPlane{re0: -2, im0: -2, re1: 2, im1: 2}
    grid = %Rectangle{h: 400, w: 400}
    calculate_iterations(complex_plane, grid, max_iterations)
  end
end
