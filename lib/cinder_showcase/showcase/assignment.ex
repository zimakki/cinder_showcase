defmodule CinderShowcase.Showcase.Assignment do
  use Ash.Resource,
    otp_app: :cinder_showcase,
    domain: CinderShowcase.Showcase,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "assignments"
    repo CinderShowcase.Repo
  end

  actions do
    defaults [
      :read,
      :destroy,
      create: [:role, :start_date, :end_date, :hours_per_week, :user_id, :project_id],
      update: [:role, :start_date, :end_date, :hours_per_week, :user_id, :project_id]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :role, :string do
      allow_nil? false
      public? true
    end

    attribute :start_date, :date do
      public? true
    end

    attribute :end_date, :date do
      public? true
    end

    attribute :hours_per_week, :integer do
      public? true
    end

    timestamps()
  end

  relationships do
    belongs_to :user, CinderShowcase.Showcase.User do
      allow_nil? false
    end

    belongs_to :project, CinderShowcase.Showcase.Project do
      allow_nil? false
    end
  end
end
