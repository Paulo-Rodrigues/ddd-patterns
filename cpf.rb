class CPF
  def self.validate(cpf = nil)
    nulos = %w[12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777
               88888888888 99999999999 00000000000 12345678909]
    return false if cpf.nil?

    valor = cpf.scan /[0-9]/

    if valor.length == 11 && !nulos.member?(valor.join)

      valor = valor.collect(&:to_i)

      # faz a soma
      soma = (10 * valor[0]) + (9 * valor[1]) + (8 * valor[2]) + (7 * valor[3]) + (6 * valor[4]) + (5 * valor[5]) + (4 * valor[6]) + (3 * valor[7]) + (2 * valor[8])

      soma -= (11 * (soma / 11))

      # resultado
      resultado1 = soma.zero? || (soma == 1) ? 0 : 11 - soma

      if resultado1 == valor[9]
        soma = (valor[0] * 11) + (valor[1] * 10) + (valor[2] * 9) + (valor[3] * 8) + (valor[4] * 7) + (valor[5] * 6) + (valor[6] * 5) + (valor[7] * 4) + (valor[8] * 3) + (valor[9] * 2)

        soma -= (11 * (soma / 11))

        resultado2 = soma.zero? || (soma == 1) ? 0 : 11 - soma

        return true if resultado2 == valor[10]

      end
    end
    false # CPF inválido
  end
end