require_relative '../cpf'

describe CPF do
  it 'valid CPF' do
    cpf = CPF.new '431.044.560-89'

    expect(cpf.valid?).to be true
  end
  
  it 'valid CPF' do
    cpf = CPF.new '627.602.350-76'

    expect(cpf.valid?).to be true
  end

  it 'valid CPF' do
    cpf = CPF.new '345.379.010-39'

    expect(cpf.valid?).to be true
  end

  it 'valid CPF' do
    cpf = CPF.new '09739663001'

    expect(cpf.valid?).to be true
  end

  it 'invalid CPF' do
    cpf = CPF.new '111.111.111-11'

    expect(cpf.valid?).to be_falsey
  end

  it 'valid CPF' do
    cpf = '09739663001'

    expect(CPF.validate(cpf)).to be true
  end
end