defmodule Complex do
  @moduledoc """
  A simple attempt at complex numbers
  """

  @typedoc """
  A structure that represents a complex number.

  * `re` - represents the *real* part
  * `im` - represents the *imaginary* part
  """
  @type t :: %__MODULE__{re: number, im: number}
  defstruct re: 0, im: 0

  @spec new(number, number) :: t
  def new(re, im) when is_number(re) and is_number(im) do
    %__MODULE__{re: re, im: im}
  end

  @spec add(t, t) :: t
  def add(a = %__MODULE__{}, b = %__MODULE__{}) do
    new(a.re + b.re, a.im + b.im)
  end

  @spec subtract(t, t) :: t
  def subtract(a = %__MODULE__{}, b = %__MODULE__{}) do
    new(a.re - b.re, a.im - b.im)
  end

  @spec multiply(t, t) :: t
  def multiply(a = %__MODULE__{}, b = %__MODULE__{}) do
    re = (a.re * b.re) + (a.im * b.im * -1)
    im = (a.re * b.im) + (b.re * a.im)
    new(re, im)
  end

  @spec mod(t) :: float
  def mod(a = %__MODULE__{}) do
    :math.sqrt(a.re * a.re + a.im * a.im)
  end
end
