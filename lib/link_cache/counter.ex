defmodule LinkCache.Counter do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [
      ets_table_name: :link_counter_table, log_limit: 1_000_000
      ], opts)
  end

  def log(slug) do
    GenServer.call(__MODULE__, {:increment, slug})
  end

  def get(slug) do
    case GenServer.call(__MODULE__, {:get, slug}) do
      [] -> {:not_found}
      [{_slug, result}] -> {:found, result}
    end
  end

  def handle_call({:get, slug}, _from, state) do
    %{ets_table_name: ets_table_name} = state
    result = :ets.lookup(ets_table_name, slug)
    {:reply, result, state}
  end

  def init(args) do
    [{:ets_table_name, ets_table_name}, {:log_limit, log_limit}] = args
    :ets.new(ets_table_name, [:named_table, :set, :private])
    {:ok, %{log_limit: log_limit, ets_table_name: ets_table_name}}
  end

end
