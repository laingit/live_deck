# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_deck,
  ecto_repos: [LiveDeck.Repo]

# Configures the endpoint
config :live_deck, LiveDeckWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: LiveDeckWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveDeck.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: System.get_env("LIVE_VIEW_SALT")]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
