defmodule ElixCodigosBancos do
  @moduledoc """
  Documentation for `Elixcodigosbancos`.
  """

  require Logger

  @doc """
  Busca as informacoes do banco de acordo com o codigo

  """
  def get_banco_by_codigo(codigo) when is_bitstring(codigo) do
    case HTTPoison.get("https://www.codigobanco.com/",
                        %{"User-Agent" => "elixcodigosbancos/1.0.1"}) do
      {:ok, %{body: raw_body, status_code: _code}} -> html = raw_body

      {:ok, document} = Floki.parse_document(html)

      banco =
        document
        |> Floki.find("tbody")
        |> Floki.find("tr")
        |> Enum.map(fn {_chave, _valor1, valor2} -> %{Enum.at(valor2,0) |> Floki.text() => [Enum.at(valor2,1) |> Floki.text(),Enum.at(valor2,2) |> Floki.text()]} end)
        |> Enum.filter(fn (x) -> x[codigo] end)

        banco

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error(inspect(reason))
    end
  end
end
