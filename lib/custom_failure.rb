class CustomFailure < Devise::FailureApp
 def redirect_url
   super
   if scope == :user
      new_user_registration_url
   else
     super
   end
 end

 def respond
  if http_auth?
   http_auth
  else
   redirect
  end
 end

end