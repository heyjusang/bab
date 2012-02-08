user = User.where("authorized = ?", false).order('created_at ASC limit 3')

user.each do |u|
  AuthorityMailer.confirm_email(u).deliver
  
  u.mailcheck = true

  u.save

end
