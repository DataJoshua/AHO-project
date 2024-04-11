class PostQuery < BaseQuery
  def sort_by_region(relation, value)
    relation.where(region_id: value)
  end

  def sort_by_author(relation, value)
    relation.where(user_id: value)
  end
end
