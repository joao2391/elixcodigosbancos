defmodule ElixCodigosBancos do
  @moduledoc """
  `ElixCodigosBancos` is a lib that helps you to get brazilian's offset codes.
  """

  require Logger
  alias ElixCodigosBancos.Banco

  @doc """
  Busca as informacoes do banco de acordo com o codigo

  """
  def get_banco_by_codigo(codigo) when is_bitstring(codigo) do
    case HTTPoison.get(
           "https://www.codigobanco.com/",
           %{"User-Agent" => "elixcodigosbancos/1.0.1"}
         ) do
      {:ok, %{body: raw_body, status_code: _code}} ->
        html = raw_body

        {:ok, document} = Floki.parse_document(html)

        banco =
          document
          |> Floki.find("tbody")
          |> Floki.find("tr")
          |> Enum.map(fn {_chave, _valor1, valor2} ->
            %Banco{
              codigo: Enum.at(valor2, 0) |> Floki.text(),
              nome: Enum.at(valor2, 1) |> Floki.text(),
              site: Enum.at(valor2, 2) |> Floki.text()
            }
          end)
          |> Enum.filter(fn x -> x.codigo == codigo end)

        banco

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error(inspect(reason))
    end
  end

  @doc """
  Busca todos os bancos
  """
  def get_bancos() do
    case HTTPoison.get(
           "https://www.codigobanco.com/",
           %{"User-Agent" => "elixcodigosbancos/1.0.1"}
         ) do
      {:ok, %{body: raw_body, status_code: _code}} ->
        html = raw_body

        {:ok, document} = Floki.parse_document(html)

        bancos =
          document
          |> Floki.find("tbody")
          |> Floki.find("tr")
          |> Enum.map(fn {_chave, _valor1, valor2} ->
            %Banco{
              codigo: Enum.at(valor2, 0) |> Floki.text(),
              nome: Enum.at(valor2, 1) |> Floki.text(),
              site: Enum.at(valor2, 2) |> Floki.text()
            }
          end)

        bancos

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error(inspect(reason))
    end
  end

  @doc """
  Busca as informacoes do banco de acordo com o nome
  """
  def get_banco_by_nome(nome) when is_bitstring(nome) do
    case HTTPoison.get(
           "https://www.codigobanco.com/",
           %{"User-Agent" => "elixcodigosbancos/1.0.1"}
         ) do
      {:ok, %{body: raw_body, status_code: _code}} ->
        html = raw_body

        {:ok, document} = Floki.parse_document(html)

        banco =
          document
          |> Floki.find("tbody")
          |> Floki.find("tr")
          |> Enum.map(fn {_chave, _valor1, valor2} ->
            %Banco{
              nome: Enum.at(valor2, 1) |> Floki.text(),
              codigo: Enum.at(valor2, 0) |> Floki.text(),
              site: Enum.at(valor2, 2) |> Floki.text()
            }
          end)
          |> Enum.filter(fn x -> String.contains?(x.nome, nome) end)

        banco

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error(inspect(reason))
    end
  end
end
