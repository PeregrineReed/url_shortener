defmodule UrlShortenerWeb.RedirectController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url

  action_fallback UrlShortenerWeb.FallbackController

  def show(conn, %{"slug" => slug}) do
    url = Urls.get_by_slug(slug)
    redirect(conn, external: url.url)
  end
end
