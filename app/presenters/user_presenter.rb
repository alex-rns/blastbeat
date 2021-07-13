# frozen_string_literal: true

# :nodoc:
class UserPresenter
  include ActionView::Helpers

  def initialize(user)
    @user = user
  end

  def username
    @user.email.split('@')[0].capitalize
  end
end
