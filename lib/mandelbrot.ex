defmodule Mandelbrot do
  @moduledoc """
  Mandlebrot fractal calculator
  """
  @max_iterations 10

  def iterate(c, z), do: iterate(c, z, 1)
  defp iterate(_c, _z, @max_iterations), do: @max_iterations
  defp iterate(c, z, iterations) when z < 2 do
    IO.puts("#{c}, #{z}, #{iterations}")
    iterate(c, (z * z) + c, iterations + 1)
  end
  defp iterate(_c, _z, iterations), do: iterations
end
