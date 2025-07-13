defmodule CinderShowcase.Showcase.Department do
  use Ash.Resource,
    otp_app: :cinder_showcase,
    domain: CinderShowcase.Showcase,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "departments"
    repo CinderShowcase.Repo
  end

  actions do
    defaults [
      :read,
      :destroy,
      create: [:name, :description, :budget, :head_count],
      update: [:name, :description, :budget, :head_count]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      public? true
    end

    attribute :budget, :decimal do
      public? true
    end

    attribute :head_count, :integer do
      public? true
    end

    timestamps()
  end

  relationships do
    has_many :projects, CinderShowcase.Showcase.Project do
      destination_attribute :department_id
    end
  end
end
