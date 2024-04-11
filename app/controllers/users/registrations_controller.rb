# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.add_role :user
    end
  end
end
