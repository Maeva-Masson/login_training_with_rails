class User < ActiveRecord::Base
  def admin?
    self.role == "Admin"
  end
end
