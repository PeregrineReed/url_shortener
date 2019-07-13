defmodule UrlShortener.Repo.Migrations.CreateUrlAccess do
  use Ecto.Migration

  def change do
    create table(:url_accesses) do
      add :access_log, :date
  end
end
