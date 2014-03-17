ActiveAdmin.register Lawyer do

  permit_params :name, :address, :department, :city, :phone, :cell_phone, :user_id#, users_attributes:[:email, :password, :password_confirmation]

  form do |f|

    f.inputs 'Lawyer Details' do
      f.input :name
      f.input :address
      f.input :city
      f.input :phone
      f.input :cell_phone
    end

    f.inputs 'User Details' do
      f.input :user
    end
    f.actions
  end

end
