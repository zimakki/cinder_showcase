defmodule CinderShowcaseWeb.PageController do
  use CinderShowcaseWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
