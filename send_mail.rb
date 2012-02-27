user = User.where("mailcheck = ?", false).order('created_at ASC limit 5')

user.each do |u|
  if u.authorized == false
  AuthorityMailer.confirm_email(u).deliver
  else
    AuthorityMailer.change_passwd_email(u).deliver
  end
  u.mailcheck = true

  u.save
end
