defmodule UrlShortenerWeb.RedirectController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Urls
  alias LinkCache.Counter
  alias LinkCache.Cache

  action_fallback UrlShortenerWeb.FallbackController

  def show(conn, %{"slug" => slug}) do
    # Counter.log(slug)
    url = Cache.fetch(slug, fn ->
      Urls.get_by_slug(slug)
    end)

    redirect(conn, external: url.url)
  end

  def stats(conn, %{"slug" => slug}) do
    url = Cache.fetch(slug, fn ->
      Urls.get_by_slug(slug)
    end)

    # count = case Counter.get(slug) do
    #   {:not_found} -> 0
    #   {:found, result} -> result
    # end

    render(conn, "stats.json", stats: %{
      id: url.id,
      url: url.url,
      short_url: url.short_url,
      access_count: 0
      })
  end
end
