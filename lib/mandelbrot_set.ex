defmodule MandelbrotSet do
  @moduledoc """
  This module provides functions to determine if a given complex constant,
  (usually denoted as `C`) is a member of the Mandelbrot set.

  ## Background information

  * https://en.wikipedia.org/wiki/Mandelbrot_set
  * http://stackoverflow.com/questions/425953/how-to-program-a-fractal
  """

  @doc """
  Given a complex number `c`, returns the number of iterations needed to prove
  whether it is a member of the Mandelbrot set, up to a maximum of
  `max_iterations`.
  """
  def count_iterations(c, max_iterations) do
    should_stop? = fn (z, iteration_count) ->
      iteration_count >= max_iterations or unbounded?(z)
    end

    iterate_until(c, should_stop?)
  end

  @doc """
  Implements the complex quadratic polynomial that is at the heart of the
  Mandelbrot set: `f(Z): Z^2 + C`
  """
  def apply_polynomial(z, c) do
    z_squared = Complex.multiply(z, z)
    Complex.add(z_squared, c)
  end

  @doc """
  Given a complex constant `c`, this function starts with `z = 0` and
  iteratively calls `apply_polynomial(z, c)` to calculate the next `z` value.

  It stops when `f_stop_iterating` returns true.

  It returns the number of iterations reached before `f_stop_iterating`
  returned true.
  """
  def iterate_until(c, f_stop_iterating) do
    do_iterate_until(c, Complex.new(0.0, 0.0), 0, f_stop_iterating)
  end

  defp do_iterate_until(c, z, iteration_count, f_stop_iterating) do
    if f_stop_iterating.(z, iteration_count) do
      iteration_count
    else
      z_next = apply_polynomial(z, c)
      do_iterate_until(c, z_next, iteration_count + 1, f_stop_iterating)
    end
  end

  @doc """
  A predicate to check if the value of z has exceeded the limit known to
  characterise a value within the Mandelbrot set.

  If |z| has exceeded 2 we know for sure that the sequence being calculated is
  unbounded and will tend towards infinity. Numbers within the Mandelbrot set
  tend towards 2 as you continue to iterate, but never exceed it.
  """
  def unbounded?(z) do
    Complex.mod(z) > 2
  end
end
