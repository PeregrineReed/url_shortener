defmodule UrlShortener.Urls.Url do
  use Ecto.Schema
  import Ecto.Changeset


  schema "urls" do
    field :short_url, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url, :short_url])
    |> unique_constraint(:short_url)
    |> validate_required([:url, :short_url])
  end
end
