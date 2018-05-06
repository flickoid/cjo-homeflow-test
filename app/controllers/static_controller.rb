class StaticController < ApplicationController
  def property_list
    @properties = Homeflow::API::Location.find_by_county_id_and_location_id(params[:county].downcase.parameterize,
                                                                            params[:town].downcase.parameterize)
                                         .location
                                         .properties
                                         .where(channel: 'sales',
                                                min_beds: params[:min_bedrooms],
                                                max_beds: params[:max_bedrooms],
                                                min_price: params[:min_price],
                                                max_price: params[:max_price])
                                         .results
                                         .properties
    render partial: 'partials/property_list', locals: { properties: @properties }
  end

  def show_property
    @property = Homeflow::API::Property.where(property_id: params[:id]).results.properties.first
    render partial: 'partials/show_property', locals: { property: @property }
  end
end
