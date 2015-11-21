defmodule Complex do
  defstruct re: 0, im: 0

  def new(re, im) do
    %__MODULE__{re: re, im: im}
  end

  def add(a, b) do
    new(a.re + b.re, a.im + b.im)
  end

  def subtract(a, b) do
    new(a.re - b.re, a.im - b.im)
  end

  def mult(a, b) do
    re = (a.re * b.re) + (a.im * b.im * -1)
    im = (a.re * b.im) + (b.re * a.im)
    new(re, im)
  end

  def mod(a) do
    :math.sqrt(a.re * a.re + a.im * a.im)
  end
end
