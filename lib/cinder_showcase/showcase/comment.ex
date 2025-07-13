defmodule CinderShowcase.Showcase.Comment do
  use Ash.Resource,
    otp_app: :cinder_showcase,
    domain: CinderShowcase.Showcase,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "comments"
    repo CinderShowcase.Repo
  end

  actions do
    defaults [:read, :destroy, create: [:content, :approved, :post_id, :author_id], update: [:content, :approved, :post_id, :author_id]]
  end

  attributes do
    uuid_primary_key :id

    attribute :content, :string do
      allow_nil? false
      public? true
    end

    attribute :approved, :boolean do
      public? true
    end

    timestamps()
  end

  relationships do
    belongs_to :post, CinderShowcase.Showcase.Post do
      allow_nil? false
    end

    belongs_to :author, CinderShowcase.Showcase.User do
      allow_nil? false
    end
  end
end
