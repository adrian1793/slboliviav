ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation

  index do
    column :email
    column :type_user do |membership|
      membership.customer.full_name unless membership.customer.nil?
    end
    column :customer do |membership|
      membership.customer.full_name unless membership.customer.nil?
    end
    column :lawyer do |membership|
      membership.lawyer.name unless membership.lawyer.nil?
    end
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email
  filter :type_user

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
