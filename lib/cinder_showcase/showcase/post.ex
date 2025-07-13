defmodule CinderShowcase.Showcase.Post do
  use Ash.Resource,
    otp_app: :cinder_showcase,
    domain: CinderShowcase.Showcase,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "posts"
    repo CinderShowcase.Repo
  end

  actions do
    defaults [
      :read,
      :destroy,
      create: [:title, :content, :published, :view_count, :author_id],
      update: [:title, :content, :published, :view_count, :author_id]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      allow_nil? false
      public? true
    end

    attribute :content, :string do
      public? true
    end

    attribute :published, :boolean do
      public? true
    end

    attribute :view_count, :integer do
      public? true
    end

    timestamps()
  end

  relationships do
    belongs_to :author, CinderShowcase.Showcase.User do
      allow_nil? false
    end

    has_many :comments, CinderShowcase.Showcase.Comment do
      destination_attribute :post_id
    end
  end
end
