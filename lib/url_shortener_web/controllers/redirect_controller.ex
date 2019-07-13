defmodule UrlShortenerWeb.RedirectController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url

  action_fallback UrlShortenerWeb.FallbackController

  def show(conn, %{"slug" => slug}) do
    url = LinkCache.Cache.fetch(slug, fn ->
      Urls.get_by_slug(slug)
    end)
    redirect(conn, external: url.url)
  end

  def stats(conn, %{"slug" => slug}) do
    url = Urls.get_by_slug(slug)
    render(conn, "stats.json", url: url <> "/stats")
  end
end
