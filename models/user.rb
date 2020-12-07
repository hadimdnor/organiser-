require 'bcrypt'

def user_found(members)
    if members.to_a.length > 0
      members[0]
    else 
      nil
    end
  end
  
  def logged_in?
    !!session[:members_id]
end
  
def current_user
    if logged_in?
      user_id = session[:members_id]
      members = run_sql("SELECT * FROM members WHERE id = #{user_id} ")
      member = user_found(members)
    else 
      nil
    end
end



def create_user(name, email, password, address, contact_num)

    password_digest = BCrypt::Password.create(members_password)
  
    run_sql("INSERT INTO members (name, email, password_digest, address, contact_num) VALUES ('#{members_name}','#{members_email}','#{password_digest}','#{members_address}','#{members_contact}')") 
end