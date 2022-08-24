defmodule RockeliveryWeb.Auth.Pipeline do
  # Define que é um plug 
  use Guardian.Plug.Pipeline, otp_app: :rockelivery

  # Plugs utilizados do guardian
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
