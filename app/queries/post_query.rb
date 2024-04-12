class PostQuery < BaseQuery
  def by_region(relation, value)
    return relation if value.blank?

    relation.where(region_id: value)
  end

  def by_author(relation, value)
    return relation if value.blank?

    relation.where(user_id: value)
  end

  def by_date(relation, value)
    return relation if value.blank?

    date = value.split(" to ")

    start_date = Date.parse(date.first)
    end_date = Date.parse(date.last) + 1.day

    relation.where(created_at: start_date..end_date)
  end
end
