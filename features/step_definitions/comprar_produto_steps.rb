Dado("as seguintes informações do usuário:") do |table|
  info = table.rows_hash
  @cpf = info[:cpf]
  @cep = info[:cep]
  @numero = info[:numero]
  @cod = info[:codigo_area]
  @telefone = info[:telefone]
end

  Dado("quer comprar o produto {string}") do |descricao|
      @descricao = descricao                                         
    end                                                                                                                    
                                                                                     
  Quando("compra o produto via boleto") do  
      @compra_page.consultar_produto(@descricao)

      resultado_ok = @compra_page.resultado_consulta()
      
      if (resultado_ok)
        @compra_page.comprar_produto(@cpf,@cep,@numero,@cod,@telefone)
          sleep 60
        end
    
  end                                                                                
                                                                                     
  Então("devo visualizar o boleto gerado com valor do produto") do                   
         
  end                                                                                                                                                              
                                                                                     