defmodule StockTracker do
  def find_max_stock_value(n, stock_changes) do
    # TODO: Implement your solution here
    
    result = [100 | add_stock(stock_changes)]
    Enum.max(result)
  end

  def add_stock([head | tail], acc \\ 100) do    
    total = acc + head
    [total | add_stock(tail, total)]
  end

  def add_stock([], _acc) do
    []
  end
end
