class CPF
  def initialize(cpf)
    @cpf = cpf
  end

  NULOS = %w[12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000]

  def self.validate(cpf)
    new(cpf).valid?
  end

  def valid?
    return false if @cpf.nil?

    valid_verified_digits? ? true : false
  end

  private

  attr_reader :cpf

  def cpf_numbers
    @cpf.scan /[0-9]/
  end

  def cpf_not_null?
    cpf_numbers.length == 11 && !NULOS.member?(cpf_numbers.join)
  end

  def cpf_numbers_to_integer
    cpf_numbers.map(&:to_i)
  end

  def first_sum
    valor = cpf_numbers_to_integer
    soma = (10 * valor[0]) + (9 * valor[1]) + (8 * valor[2]) + (7 * valor[3]) + (6 * valor[4]) + (5 * valor[5]) + (4 * valor[6]) + (3 * valor[7]) + (2 * valor[8])

    difference(soma)
  end

  def second_sum
    valor = cpf_numbers_to_integer
    soma = (valor[0] * 11) + (valor[1] * 10) + (valor[2] * 9) + (valor[3] * 8) + (valor[4] * 7) + (valor[5] * 6) + (valor[6] * 5) + (valor[7] * 4) + (valor[8] * 3) + (valor[9] * 2)
    
    difference(soma)
  end

  def difference(soma)
    soma - (soma / 11) * 11
  end

  def result(soma)
    soma.zero? || (soma == 1) ? 0 : 11 - soma
  end

  def verified_first_digit?
    result(first_sum) == cpf_numbers_to_integer[9]
  end

  def verified_second_digit?
    result(second_sum) == cpf_numbers_to_integer[10]
  end

  def valid_verified_digits?
    cpf_not_null? && verified_first_digit? && verified_second_digit?
  end
end