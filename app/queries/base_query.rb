class BaseQuery
  def initialize(filter_params, relation)
    @filter_params = filter_params
    @relation = relation
  end

  attr_reader :filter_params, :relation

  def all
    filter_params.reduce(relation) do |relation, (key, value)|
      public_send(:"by_#{key}", relation, value)
    end
  end
end
