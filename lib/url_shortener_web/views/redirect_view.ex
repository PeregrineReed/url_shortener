defmodule UrlShortenerWeb.RedirectView do
  use UrlShortenerWeb, :view
  alias UrlShortenerWeb.RedirectView

  def render("stats.json", %{stats: url}) do
    %{id: url.id,
      url: url.url,
      short_url: url.short_url,
      access_count: 0}
  end
end
