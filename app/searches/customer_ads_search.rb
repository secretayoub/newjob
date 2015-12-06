# https://github.com/toptal/chewy_example/blob/master/app/searches/entertainment_search.rb
class CustomerAdsSearch
  include ActiveData::Model

  SORT = {title: {'title.sorted' => :asc}, relevance: :_score}

  attribute :query, type: String
  attribute :tags, mode: :arrayed, type: String, normalize: ->(value) { value.reject(&:blank?) }
  attribute :cdd, mode: :arrayed, type: String, normalize: ->(value) { value.reject(&:blank?) }
  attribute :cdi, mode: :arrayed, type: String, normalize: ->(value) { value.reject(&:blank?) }
  attribute :stage, mode: :arrayed, type: String, normalize: ->(value) { value.reject(&:blank?) }
  attribute :freelance, mode: :arrayed, type: String, normalize: ->(value) { value.reject(&:blank?) }
  attribute :sort, type: String, enum: %w(title relevance), default_blank: 'relevance'

  def tag_list= value
    self.tags = value
  end

  def tag_list
    self.tags
  end

  def cdd_choice= value
    self.cdd = value
  end

  def cdd_choice
    self.cdd
  end

  def cdi_choice= value
    self.cdi = value
  end

  def cdi_choice
    self.cdi
  end

  def stage_choice= value
    self.stage = value
  end

  def stage_choice
    self.stage
  end

  def freelance_choice= value
    self.freelance = value
  end

  def freelance_choice
    self.freelance
  end


  def index
    CustomerAdsIndex
  end

  def search
    [query_string, tags_filter, contract_filter, sorting].compact.reduce(:merge)
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

  def check_contract(value)
    unless value.nil?
      return value
    else
      return ""
    end
  end


  def contract_filter
    index.filter(terms: {contract_types: [ check_contract(cdd),check_contract(cdi), check_contract(stage), check_contract(freelance)] }) if cdd? || cdi? || stage? || freelance?
  end
end
