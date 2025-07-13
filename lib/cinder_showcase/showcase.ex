defmodule CinderShowcase.Showcase do
  use Ash.Domain,
    otp_app: :cinder_showcase

  resources do
    resource CinderShowcase.Showcase.User
    resource CinderShowcase.Showcase.Department
    resource CinderShowcase.Showcase.Post
    resource CinderShowcase.Showcase.Comment
    resource CinderShowcase.Showcase.Project
    resource CinderShowcase.Showcase.Assignment
  end
end
