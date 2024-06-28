defmodule PietWeb.ErrorJSONTest do
  use PietWeb.ConnCase, async: true

  test "renders 404" do
    assert PietWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PietWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
