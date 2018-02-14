class Portal::FilterForm
  extend ActiveModel::Naming
  include Tainbox
  attribute :country
  attribute :city

  def values
    {
      country: country.present? ? "like '%#{country}%'" : nil,
      city: city.present? ? "like '%#{city}%'" : nil,
    }.compact.map{ |k, v| "#{k} #{v}"}.join("AND")
  end
end
