defmodule ElixirMixTest do

  use ExUnit.Case
  use ElixirMix.GitHub

  test "the truth" do
    GitHub.get("users/myfreeweb").body[:public_repos]
    IO.puts response
    assert 1 + 1 == 2
  end

end
