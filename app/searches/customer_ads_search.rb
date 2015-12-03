# https://github.com/toptal/chewy_example/blob/master/app/searches/entertainment_search.rb
class CustomerAdsSearch
  include ActiveData::Model

  SORT = {title: {'title.sorted' => :asc}, relevance: :_score}

  attribute :query, type: String
  attribute :tags, mode: :arrayed, type: String, normalize: ->(value) { value.reject(&:blank?) }
  attribute :sort, type: String, enum: %w(title relevance), default_blank: 'relevance'

  def tag_list= value
    self.tags = value
  end

  def tag_list
    self.tags
  end

  def index
    CustomerAdsIndex
  end

  def search
    [query_string, tags_filter, sorting].compact.reduce(:merge)
  end

  def sorting
    index.order(SORT[sort])
  end

  def query_string
    index.query(query_string: {fields: [:title, :customer], query: query, default_operator: 'and'}) if query?
  end
  def tags_filter
    index.filter(terms: {tags: [tags]}) if tags?
  end
end
