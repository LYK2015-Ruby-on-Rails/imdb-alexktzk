module CastsHelper

  def print_name(cast)

    return "" unless cast
    cast.full_name.values.join(" ")
  end

  def print_cast_occupations(cast)
    cast.occupations.map { |e| e.title + ", " unless e.last }.uniq
  end

end
