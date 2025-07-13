# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CinderShowcase.Repo.insert!(%CinderShowcase.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CinderShowcase.Showcase
alias CinderShowcase.Showcase.{User, Department, Post, Comment, Project, Assignment}

IO.puts("🌱 Starting database seeding...")

# Clear existing data
Ash.bulk_destroy!(Assignment, :destroy, %{}, return_errors?: true)
Ash.bulk_destroy!(Comment, :destroy, %{}, return_errors?: true)
Ash.bulk_destroy!(Post, :destroy, %{}, return_errors?: true)
Ash.bulk_destroy!(Project, :destroy, %{}, return_errors?: true)
Ash.bulk_destroy!(User, :destroy, %{}, return_errors?: true)
Ash.bulk_destroy!(Department, :destroy, %{}, return_errors?: true)

IO.puts("🧹 Cleared existing data")

# Helper functions
defmodule SeedHelpers do
  def random_element(list), do: Enum.random(list)
  
  def random_string(length \\ 10) do
    :crypto.strong_rand_bytes(length)
    |> Base.encode64()
    |> binary_part(0, length)
  end
  
  def random_sentence(word_count \\ 10) do
    words = ["the", "quick", "brown", "fox", "jumps", "over", "lazy", "dog", "amazing", "incredible", 
             "fantastic", "wonderful", "brilliant", "excellent", "outstanding", "remarkable", "exceptional",
             "innovative", "creative", "efficient", "powerful", "robust", "scalable", "flexible", "modern",
             "enterprise", "solution", "platform", "framework", "application", "system", "technology",
             "development", "implementation", "integration", "optimization", "performance", "security"]
    
    1..word_count
    |> Enum.map(fn _ -> random_element(words) end)
    |> Enum.join(" ")
    |> String.capitalize()
  end
  
  def random_paragraph(sentence_count \\ 3) do
    1..sentence_count
    |> Enum.map(fn _ -> random_sentence(Enum.random(8..15)) end)
    |> Enum.join(". ")
    |> Kernel.<>(".")
  end
  
  def random_date_in_past(days_back \\ 365) do
    Date.utc_today()
    |> Date.add(-Enum.random(1..days_back))
  end
  
  def random_date_in_future(days_ahead \\ 365) do
    Date.utc_today()
    |> Date.add(Enum.random(1..days_ahead))
  end
end

# Create Departments (50)
IO.puts("🏢 Creating departments...")

department_names = [
  "Engineering", "Marketing", "Sales", "Human Resources", "Finance", "Operations", 
  "Product Management", "Design", "Data Science", "DevOps", "Quality Assurance",
  "Customer Success", "Business Development", "Legal", "Compliance", "Security",
  "Research & Development", "Analytics", "Training", "Facilities", "IT Support",
  "Content Marketing", "Social Media", "Public Relations", "Partnerships",
  "Strategy", "Innovation", "Consulting", "Professional Services", "Support",
  "Documentation", "Localization", "User Experience", "Platform Engineering",
  "Mobile Development", "Frontend Engineering", "Backend Engineering", 
  "Machine Learning", "Artificial Intelligence", "Cloud Infrastructure",
  "Database Administration", "Network Operations", "Site Reliability",
  "Technical Writing", "Developer Relations", "Community Management",
  "Business Intelligence", "Financial Planning", "Procurement", "Vendor Management"
]

departments = Enum.map(department_names, fn name ->
  {:ok, dept} = Ash.create(Department, %{
    name: name,
    description: SeedHelpers.random_paragraph(2),
    budget: Decimal.new(Enum.random(100_000..5_000_000)),
    head_count: Enum.random(5..200)
  })
  dept
end)

IO.puts("✅ Created #{length(departments)} departments")

# Create Users (500)
IO.puts("👥 Creating users...")

user_statuses = [:active, :inactive, :pending, :suspended]
first_names = ["Alice", "Bob", "Charlie", "Diana", "Eve", "Frank", "Grace", "Henry", "Ivy", "Jack",
               "Kate", "Liam", "Mia", "Noah", "Olivia", "Paul", "Quinn", "Ruby", "Sam", "Tara",
               "Uma", "Victor", "Wendy", "Xavier", "Yara", "Zoe", "Aaron", "Bella", "Colin", "Dora",
               "Ethan", "Fiona", "George", "Hannah", "Ian", "Julia", "Kevin", "Luna", "Marcus", "Nina",
               "Oscar", "Penny", "Quinton", "Rachel", "Steve", "Tina", "Ulrich", "Vera", "William", "Xara"]
               
last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez",
              "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas", "Taylor", "Moore", "Jackson", "Martin",
              "Lee", "Perez", "Thompson", "White", "Harris", "Sanchez", "Clark", "Ramirez", "Lewis", "Robinson",
              "Walker", "Young", "Allen", "King", "Wright", "Scott", "Torres", "Nguyen", "Hill", "Flores",
              "Green", "Adams", "Nelson", "Baker", "Hall", "Rivera", "Campbell", "Mitchell", "Carter", "Roberts"]

users = for i <- 1..500 do
  first_name = SeedHelpers.random_element(first_names)
  last_name = SeedHelpers.random_element(last_names)
  
  {:ok, user} = Ash.create(User, %{
    name: "#{first_name} #{last_name}",
    email: "#{String.downcase(first_name)}.#{String.downcase(last_name)}#{i}@cindershow.case",
    status: SeedHelpers.random_element(user_statuses),
    profile: %{
      bio: SeedHelpers.random_paragraph(1),
      location: SeedHelpers.random_element(["San Francisco", "New York", "London", "Berlin", "Tokyo", "Sydney", "Toronto", "Amsterdam"]),
      skills: Enum.take_random(["Elixir", "Phoenix", "React", "TypeScript", "Python", "Go", "Rust", "Java", "C++", "JavaScript"], Enum.random(2..5)),
      experience_years: Enum.random(1..20),
      github: "#{String.downcase(first_name)}#{String.downcase(last_name)}",
      linkedin: "#{String.downcase(first_name)}-#{String.downcase(last_name)}"
    }
  })
  
  if rem(i, 100) == 0, do: IO.puts("  Created #{i} users...")
  user
end

IO.puts("✅ Created #{length(users)} users")

# Create Projects (200)
IO.puts("🚀 Creating projects...")

project_statuses = [:planning, :active, :on_hold, :completed, :cancelled]
project_types = ["Web Application", "Mobile App", "API Service", "Data Pipeline", "Machine Learning Model",
                "DevOps Infrastructure", "Analytics Dashboard", "E-commerce Platform", "Content Management System",
                "Customer Portal", "Admin Dashboard", "Integration Service", "Monitoring System", "Security Tool"]

projects = for i <- 1..200 do
  project_type = SeedHelpers.random_element(project_types)
  department = SeedHelpers.random_element(departments)
  
  {:ok, project} = Ash.create(Project, %{
    name: "#{project_type} #{SeedHelpers.random_string(4)}",
    description: SeedHelpers.random_paragraph(3),
    status: SeedHelpers.random_element(project_statuses),
    deadline: SeedHelpers.random_date_in_future(365),
    budget: Decimal.new(Enum.random(10_000..1_000_000)),
    department_id: department.id
  })
  
  if rem(i, 50) == 0, do: IO.puts("  Created #{i} projects...")
  project
end

IO.puts("✅ Created #{length(projects)} projects")

# Create Posts (400)
IO.puts("📝 Creating posts...")

post_topics = ["Technical Tutorial", "Product Update", "Engineering Blog", "Team Announcement", 
               "Industry News", "Best Practices", "Case Study", "How-to Guide", "Release Notes",
               "Conference Talk", "Workshop", "Code Review", "Architecture Decision", "Performance Analysis"]

posts = for i <- 1..400 do
  author = SeedHelpers.random_element(users)
  topic = SeedHelpers.random_element(post_topics)
  
  {:ok, post} = Ash.create(Post, %{
    title: "#{topic}: #{SeedHelpers.random_sentence(5)}",
    content: SeedHelpers.random_paragraph(5),
    published: Enum.random([true, false, true, true]), # 75% published
    view_count: Enum.random(0..10_000),
    author_id: author.id
  })
  
  if rem(i, 100) == 0, do: IO.puts("  Created #{i} posts...")
  post
end

IO.puts("✅ Created #{length(posts)} posts")

# Create Comments (800) 
IO.puts("💬 Creating comments...")

comments = for i <- 1..800 do
  post = SeedHelpers.random_element(posts)
  author = SeedHelpers.random_element(users)
  
  {:ok, comment} = Ash.create(Comment, %{
    content: SeedHelpers.random_paragraph(1),
    approved: Enum.random([true, false, true, true, true]), # 80% approved
    post_id: post.id,
    author_id: author.id
  })
  
  if rem(i, 200) == 0, do: IO.puts("  Created #{i} comments...")
  comment
end

IO.puts("✅ Created #{length(comments)} comments")

# Create Assignments (600)
IO.puts("📋 Creating assignments...")

roles = ["Lead Developer", "Senior Developer", "Developer", "Junior Developer", "Tech Lead", 
         "Product Manager", "Designer", "DevOps Engineer", "QA Engineer", "Data Scientist",
         "Business Analyst", "Project Manager", "Scrum Master", "Architect", "Consultant"]

assignments = for i <- 1..600 do
  user = SeedHelpers.random_element(users)
  project = SeedHelpers.random_element(projects)
  role = SeedHelpers.random_element(roles)
  
  start_date = SeedHelpers.random_date_in_past(180)
  end_date = Date.add(start_date, Enum.random(30..365))
  
  {:ok, assignment} = Ash.create(Assignment, %{
    role: role,
    start_date: start_date,
    end_date: end_date,
    hours_per_week: Enum.random(10..40),
    user_id: user.id,
    project_id: project.id
  })
  
  if rem(i, 150) == 0, do: IO.puts("  Created #{i} assignments...")
  assignment
end

IO.puts("✅ Created #{length(assignments)} assignments")

# Summary
total_records = length(departments) + length(users) + length(projects) + length(posts) + length(comments) + length(assignments)

IO.puts("""

🎉 Database seeding completed successfully!

Summary:
  📊 Total records created: #{total_records}
  🏢 Departments: #{length(departments)}
  👥 Users: #{length(users)}  
  🚀 Projects: #{length(projects)}
  📝 Posts: #{length(posts)}
  💬 Comments: #{length(comments)}
  📋 Assignments: #{length(assignments)}

The database now contains over 1000+ records with realistic relationships
and sample data perfect for demonstrating Cinder table and card components.
""")