# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :realworld, RealworldWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RealworldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Realworld.PubSub,
  live_view: [signing_salt: "WoMwX3/2"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :realworld, Realworld.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# https://ash-hq.org/docs/guides/ash/latest/tutorials/get-started#temporary-config
# For backwards compatibility, the following configuration is required. Don’t worry about it for now, just know that it needs to be set until the behavior is deprecated in the next major release.
config :ash, :use_all_identities_in_manage_relationship?, false

config :realworld, :ash_apis, [Realworld.Accounts]

config :realworld, ecto_repos: [Realworld.Repo]

config :realworld,
  token_signing_secret: "WJ/qX8VMGRT192yLhUvJrRM32W1iycdvKVzOVfk6pJSDqF2rRRyhluZW1NRUyo83"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
