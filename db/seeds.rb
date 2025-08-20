u = User.find_or_create_by!(email: "demo@example.com") do |usr|
  usr.password = "demo1234"
end
u.tasks.create!(title: "Primeira task")
u.tasks.create!(title: "Estudar Rails API")
