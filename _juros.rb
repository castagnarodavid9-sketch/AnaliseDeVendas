require 'date'

=begin
3. Faça um programa que a partir de um valor e de uma data de vencimento,
calcule o valor dos juros na data de hoje considerando que a multa seja de 2,5% ao dia.
=end

puts "=" * 50
puts "Cálculo de juros da Target Sistemas"
puts "=" * 50

puts "Informe o valor da prestação:"
prest = gets.chomp.to_f

puts "Informe a data de vencimento (dd/mm/aaaa):"
data_venc = Date.strptime(gets.chomp, "%d/%m/%Y")

data_hoje = Date.today

if data_hoje > data_venc
  dias_atraso = (data_hoje - data_venc).to_i
  juros = prest * 0.025 * dias_atraso
  total = prest + juros

  puts "\nDias em atraso: #{dias_atraso}"
  puts "Valor dos juros: R$ #{'%.2f' % juros}"
  puts "Valor total a pagar: R$ #{'%.2f' % total}"
else
  puts "\nPagamento em dia. Valor a pagar: R$ #{'%.2f' % prest}"
end
