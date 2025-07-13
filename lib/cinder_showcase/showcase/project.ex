defmodule CinderShowcase.Showcase.Project do
  use Ash.Resource,
    otp_app: :cinder_showcase,
    domain: CinderShowcase.Showcase,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "projects"
    repo CinderShowcase.Repo
  end

  actions do
    defaults [
      :read,
      :destroy,
      create: [:name, :description, :status, :deadline, :budget, :department_id],
      update: [:name, :description, :status, :deadline, :budget, :department_id]
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

    attribute :status, :atom do
      public? true
    end

    attribute :deadline, :date do
      public? true
    end

    attribute :budget, :decimal do
      public? true
    end

    timestamps()
  end

  relationships do
    belongs_to :department, CinderShowcase.Showcase.Department

    has_many :assignments, CinderShowcase.Showcase.Assignment do
      destination_attribute :project_id
    end
  end
end
