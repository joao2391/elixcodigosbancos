defmodule ElixCodigosBancosTest do
  use ExUnit.Case
  doctest ElixCodigosBancos

  test "retorna 01 banco com o codigo 029" do
    assert ElixCodigosBancos.get_banco_by_codigo("029") |> Enum.count() == 1
  end

  test "retorna 234 bancos" do
    assert ElixCodigosBancos.get_bancos() |> Enum.count() == 234
  end

  test "retorna 04 bancos com o nome Bradesco" do
    assert ElixCodigosBancos.get_banco_by_nome("Bradesco") |> Enum.count() == 4
  end
end
