class CustomerAdsIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      title: {
        tokenizer: 'standard',
        filter: ['lowercase', 'asciifolding']
      },
      sorted: {
        tokenizer: 'keyword',
        filter: ['lowercase', 'asciifolding']
      }
    }
  }

  define_type Customer::Ad.includes(:customer, :tags) do
    field :title, type: 'multi_field' do
      field :title, index: 'analyzed', analyzer: 'title'
      field :sorted, index: 'analyzed', analyzer: 'sorted'
    end
    field :customer, value: -> { customer.company_name }
    field :tags, index: 'not_analyzed', value: ->{ tags.map(&:name) }

  end
end
