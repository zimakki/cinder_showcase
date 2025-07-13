defmodule CinderShowcase.Showcase.User do
  use Ash.Resource,
    otp_app: :cinder_showcase,
    domain: CinderShowcase.Showcase,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "users"
    repo CinderShowcase.Repo
  end

  actions do
    defaults [
      :read,
      :destroy,
      create: [:email, :name, :status, :profile],
      update: [:email, :name, :status, :profile]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :email, :string do
      allow_nil? false
      public? true
    end

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :status, :atom do
      public? true
    end

    attribute :profile, :map do
      public? true
    end

    timestamps()
  end

  relationships do
    has_many :posts, CinderShowcase.Showcase.Post do
      destination_attribute :author_id
    end

    has_many :comments, CinderShowcase.Showcase.Comment do
      destination_attribute :author_id
    end

    has_many :assignments, CinderShowcase.Showcase.Assignment do
      destination_attribute :user_id
    end
  end
end
