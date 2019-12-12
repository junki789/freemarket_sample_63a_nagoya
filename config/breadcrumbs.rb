crumb :root do
  link 'フリーマーケット', root_path
end

crumb :users do
  link 'マイページ', user_path(current_user.id)
end

crumb :prof do
  link 'プロフィール', edit_user_path
  parent :users
end

crumb :card do
  link '支払い情報', credit_users_path
  parent :users
end

crumb :out do
  link 'ログアウト', edit_user_registration_path
  parent :users
end

crumb :check do
  link '本人確認', confirmation_users_path
  parent :users
end

crumb :detail do
  link '商品詳細', item_path
  parent :root
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).