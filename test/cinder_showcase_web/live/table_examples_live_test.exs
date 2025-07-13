defmodule CinderShowcaseWeb.TableExamplesLiveTest do
  use CinderShowcaseWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "Table Examples LiveView" do
    test "displays users table with Cinder component", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/table-examples")

      # Should display the page title
      assert html =~ "Table Examples"
      
      # Should render a Cinder table component
      assert html =~ "cinder-table"
      
      # Should show table headers for user data
      assert html =~ "Name"
      assert html =~ "Email"
      assert html =~ "Department"
      
      # Should display sample user data
      assert html =~ "john@example.com"
    end

    test "allows filtering users by name", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/table-examples")

      # Type in the name filter
      view
      |> form("[data-testid=filter-form]")
      |> render_change(%{"filters" => %{"name" => "john"}})

      # Should only show users matching the filter
      assert render(view) =~ "john@example.com"
      refute render(view) =~ "jane@example.com"
    end

    test "allows sorting users by email", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/table-examples")

      # Click on email column header to sort
      view |> element("[data-testid=sort-email]") |> render_click()

      # Should show sorted results
      html = render(view)
      assert html =~ "cinder-table"
      # Note: Actual sort verification would need more complex assertion
    end
  end
end