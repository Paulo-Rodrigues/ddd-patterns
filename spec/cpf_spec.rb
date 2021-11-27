require_relative '../cpf'

describe CPF do
  it 'valid CPF' do
    cpf = '735.618.650-03'

    expect(CPF.validate(cpf)).to be true
  end

  it 'invalid CPF' do
    cpf = '111.111.111-11'

    expect(CPF.validate(cpf)).to be_falsey
  end
end