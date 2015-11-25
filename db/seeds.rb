types = [
    {title: 'CDD'},
    {title: 'CDI'},
    {title: 'Stage'},
    {title: 'Freelance'}
]

renumeration = [
    {title: '20k€ - 30k€'},
    {title: '30k€ - 36k€'},
    {title: '37k€ - 45k€'},
    {title: '45k€ - 60k€'}
]

Customer::ContractType.create(types)
Customer::Renumeration.create(renumeration)
