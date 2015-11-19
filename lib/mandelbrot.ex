defmodule Mandelbrot do
  @max_iterations 10

  def iterate(c, z, iterations \\ 1)
  def iterate(_c, _z, iterations) when iterations < 1 or iterations > @max_iterations do
    msg = "iterations must be 1 < x <= #{@max_iterations} but was #{iterations}"
    raise ArgumentError, message: msg
  end
  def iterate(_c, _z, @max_iterations), do: @max_iterations
  def iterate(c, z, iterations) when z < 2 do
    IO.puts("#{c}, #{z}, #{iterations}")
    iterate(c, (z * z) + c, iterations + 1)
  end
  def iterate(_c, _z, iterations), do: iterations
end
