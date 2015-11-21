defmodule Complex do
  defstruct re: 0, im: 0

  def new(re, im) do
    %__MODULE__{re: re, im: im}
  end
end
