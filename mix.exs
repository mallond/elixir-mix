defmodule ElixirMix.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_mix,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {ElixirMix, []},
     applications: [:logger, :phoenix, :cowboy, :httpotion]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.9.0"},
     {:cowboy, "~> 1.0"},
     {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.1"},
     {:poison, "~> 1.3.1"},
     {:httpotion, "~> 2.0.0"},
     {:json,   "~> 0.3.0"}
     ]
  end
end
