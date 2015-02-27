use Mix.Config

config :elixir_mix, ElixirMix.Endpoint,
  http: [port: System.get_env("PORT") || 4001]

# Print only warnings and errors during test
config :logger, level: :warn