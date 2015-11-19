defmodule Mandelbrot do
  @moduledoc """
  Mandlebrot fractal calculator
  """
  @max_iterations 10

  def iterate(c, z), do: iterate(c, z, 1)
  defp iterate(_c, _z, @max_iterations), do: @max_iterations
  defp iterate(c, z, iterations) when z < 2 do
    # IO.puts("#{c}, #{z}, #{iterations}")
    iterate(c, (z * z) + c, iterations + 1)
  end
  defp iterate(_c, _z, iterations), do: iterations

  def frange(from, to, increment) do
    Stream.unfold(from, fn
      n when n > to -> nil
      n -> {n, n + increment}
    end)
  end

  def generate do
    increment = 0.1
    for x <- frange(-1.5, 1.5, increment),
        y <- frange(-1.5, 1.5, increment), do: {x, y, iterate(x, y)}
  end
end