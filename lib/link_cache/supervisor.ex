defmodule LinkCache.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(LinkCache.Cache, [[name: LinkCache.Cache]]),
      worker(LinkCache.Counter, [[name: LinkCache.Counter]])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
