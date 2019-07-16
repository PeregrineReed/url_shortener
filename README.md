# UrlShortener

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Directions from Workshop

### Phase 1:

Write a web application that allows users to take a long URL & convert it to a shortened URL.

(mix phx.new PUT_YOUR_APP_NAME_HERE --no-webpack --no-html)

Feel free to use scaffolds to get yourself started.

https://devhints.io/phoenix
https://devhints.io/phoenix-ecto
https://devhints.io/phoenix-routing
https://hexdocs.pm/phoenix/Phoenix.Router.html#match/5
https://hexdocs.pm/phoenix/up_and_running.html

Example:

http://really-long-url.com/the/page/I/am/looking/for -> http://localhost:4000/abc1234

(play with bit.ly if you want to see an example)

The program should:

Accept a long URL

Allow the user to provide a short local URL like /abc1234

Store the short URL & the long URL together

Both short and long urls are unique.

Redirect visitors to the long URL when the short URL is visited

Use postgres as the datastore.

Detect duplicate URLs. Don't create a new short URL if one already exists

### Phase 2:

Add a cache to the redirect backed by a GenServer using ets as its datastore.

https://thoughtbot.com/blog/make-phoenix-even-faster-with-a-genserver-backed-key-value-store

In your application.ex instead of following the guide’s syntax add this to the list of supervised children:
 {ShortenApi.Cache.Supervisor, []}

### Phase 3:

Track the number of times the short URL is visited

Provide a statistics page for the short URL, such as /abc1234/stats

Visiting this URL should show:
short URL
long URL
number of times the short URL was accessed
Optionally, record the date and time each short URL was accessed

https://jmilet.github.io/ets/counters/elixir/erlang/2016/05/07/ets-counters.html

### Phase 4:

Replace Postgres with a GenServer using Mnesia. 

### Phase 5: 

Don't allow an invalid URL to be entered into the form.

Use hashids when the user does not provide a short url path. https://github.com/alco/hashids-elixir#usage


## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
