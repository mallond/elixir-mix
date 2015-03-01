defmodule Simple_Test do
  use ExUnit.Case
  use HTTPoison.Base
  test "the truth" do
    assert 1 + 1 == 2
  end

end
