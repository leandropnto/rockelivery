defmodule Rockelivery.Orders.Report do
  import Ecto.Query
  alias Rockelivery.{Repo, Order}

  def create(filename \\ "report.csv") do
    query = from order in Order, order_by: order.user_id

    Repo.transaction(fn ->
      query
      |> Repo.stream()
      |> Stream.chunk_every(500)
      |> Stream.flat_map(fn chunck -> Repo.preload(chunck, :items) end)
      |> Enum.into([])
      |> IO.inspect()
    end)
  end
end

