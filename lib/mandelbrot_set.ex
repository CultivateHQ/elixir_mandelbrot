defmodule MandelbrotSet do
  @moduledoc """
  This module provides functions to determine if a given complex constant,
  (usually denoted as `C`) is a member of the Mandelbrot set.

  ## Background information

  * https://en.wikipedia.org/wiki/Mandelbrot_set
  * http://stackoverflow.com/questions/425953/how-to-program-a-fractal
  """

  @doc """
  Implements the complex quadratic polynomial that is at the heart of the
  Mandelbrot set: `f(Z): Z^2 + C`
  """
  def apply_polynomial(z, c) do
    z_squared = Complex.multiply(z, z)
    Complex.add(z_squared, c)
  end
end
