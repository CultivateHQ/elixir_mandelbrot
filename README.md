# Mandelbrot

Intended to be a Mandelbrot fractal image generator.

However, the purpose of the project is more about learning how to do this
in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add mandelbrot to your list of dependencies in `mix.exs`:

        def deps do
          [{:mandelbrot, "~> 0.0.1"}]
        end

  2. Ensure mandelbrot is started before your application:

        def application do
          [applications: [:mandelbrot]]
        end

## Development Tasks

Download required dependencies:

```
$ mix deps.get
```

Execute the tests by running:

```
$ mix test
```

Generate API docs:

```
$ mix docs
$ open doc/index.html
```

Get code style feedback by running:

```
$ mix dogma
```

If you have Dialyzer set up to analyze Elixir projects, run a static analysis
like this:

```
$ mix test && dialyzer --plt <path to your plt file> _build/test/lib/mandelbrot/ebin/
```

(You can omit `--plt <path to your plt file>` if you are using dialyzer's
default PLT file `~/.dialyzer_plt`)
