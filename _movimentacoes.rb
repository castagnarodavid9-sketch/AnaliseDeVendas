=begin
  2. Faça um programa onde eu possa lançar movimentações de estoque dos produtos que estão no json abaixo, dando entrada ou saída da mercadoria no meu depósito, onde cada movimentação deve ter:
  ⦁	Um número identificador único.
  ⦁	Uma descrição para identificar o tipo da movimentação realizada
  E que ao final da movimentação me retorne a qtde final do estoque do produto movimentado.
=end

array_estoque = [
  { codigoProduto: 101, descricaoProduto: "Caneta Azul", estoque: 150 },
  { codigoProduto: 102, descricaoProduto: "Caderno Universitário", estoque: 75 },
  { codigoProduto: 103, descricaoProduto: "Borracha Branca", estoque: 200 },
  { codigoProduto: 104, descricaoProduto: "Lápis Preto HB", estoque: 320 },
  { codigoProduto: 105, descricaoProduto: "Marcador de Texto Amarelo", estoque: 90 }
]

movimentacoes = [] # Array para armazenar todas as movimentações
mov_id = 1         # Identificador único para cada movimentação

puts "="*50
puts "Seja bem-vindo ao controle de estoque da Target Sistemas"
puts "="*50

loop do
  puts "\nQual operação deseja realizar?"
  puts "(0) Retirar item do estoque"
  puts "(1) Adicionar item ao estoque"
  puts "(2) Encerrar programa"
  opc = gets.chomp.to_i

  case opc
  when 0, 1
    system('cls') rescue system('clear')
    puts "=" * 50
    puts "Itens em estoque:"
    array_estoque.each do |e|
      puts "  (#{e[:codigoProduto]}) - #{e[:descricaoProduto]} - Qtde: #{e[:estoque]}"
    end

    print "\nDigite o código do produto: "
    codigo_digitado = gets.chomp.to_i

    produto = array_estoque.find { |p| p[:codigoProduto] == codigo_digitado }

    if produto.nil?
      puts "❌ Produto não encontrado!"
      sleep(2)
      next
    end

    print "Digite a quantidade: "
    quantidade = gets.chomp.to_i

    print "Digite uma descrição para a movimentação: "
    descricao = gets.chomp

    if opc == 0
      if quantidade > produto[:estoque]
        puts "❌ Não há estoque suficiente!"
        next
      end
      produto[:estoque] -= quantidade
      tipo = "Saída"
    else
      produto[:estoque] += quantidade
      tipo = "Entrada"
    end

    movimentacoes << { id: mov_id, codigoProduto: produto[:codigoProduto], tipo: tipo, descricao: descricao, quantidade: quantidade }
    mov_id += 1

    puts "✅ Movimentação registrada!"
    puts "Produto: #{produto[:descricaoProduto]} | Estoque atual: #{produto[:estoque]}"

  when 2
    puts "Programa encerrado!"
    break
  else
    puts "❌ Opção inválida!"
  end
end
