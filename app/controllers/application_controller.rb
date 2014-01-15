class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # @param [Fixnum] num_colors - numbers of colors to generate
  # @return [Array] array of HSL color codes as strings
  # https://github.com/jondot/graphene/blob/master/tools/gencolors.rb
  def gen_colors(num_colors)
    colors = []
    interval = 360/num_colors
    i = 190
    j = 1

    # Figure out what a full circle from the start would be
    max = i + 360

    # Iterate until we make a full circle
    while i < max
      # Since we can get higher than 360, find the right value
      color = i % 360
      colors.push("hsl(#{color}, 50%, 50%)")
      # puts ".h-col-#{j}{ stroke: hsl(#{color}, 100%, 50%); fill: hsl(#{color}, 100%, 50%);}"
      j +=1
      i += interval
    end
    return colors
  end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:last_name, :first_name]
    end

end
