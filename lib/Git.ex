defmodule GitHub do
  use HTTPotion.Base

  def process_url(url) do
    "https://api.github.com/" <> url
  end

  def process_request_headers(headers) do
    Dict.put headers, :"User-Agent", "github-potion"
  end

  def process_response_body(body) do
    body |> to_string |> :jsx.decode
    |> Enum.map fn ({k, v}) -> { String.to_atom(k), v } end
    |> :orddict.from_list
  end
end