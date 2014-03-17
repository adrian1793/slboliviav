# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  #layout :false


  def new
    build_resource({})
    self.resource.build_customer
    @country = Country.first
    @cities = @country.states.empty? ? [] : @country.states.first.cities
    respond_with self.resource
  end

  def create
    build_resource(sign_up_params)
    #raise resource.customer.city_id.inspect
    @country = Country.find(params[:country])
    #raise resource.customer.city.inspect
    @cities = @country.states.empty? ? [] : @country.states.first.cities

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end

  end

end