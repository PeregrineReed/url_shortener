defmodule LinkCache.Counter do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [
      ets_table_name: :link_counter_table, log_limit: 1_000_000
      ], opts)
  end

  def log(counter, slug) when n > 0 do
    :ets.update_counter(counter, slug, 1, {1, 0})
  end

  defp get(counter, slug) do
    :ets.lookup(counter, slug)
  end

  defp set(slug) do
    :ets.new(:counter, [:public])
  end

end
