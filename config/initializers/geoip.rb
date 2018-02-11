GEO = MaxMindDB.new(ENV["MMDB"] || "#{ENV["HOME"]}/Downloads/GeoLite2-City_20180102/GeoLite2-City.mmdb")
