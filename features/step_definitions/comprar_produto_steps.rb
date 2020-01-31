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

      campo_busca = find('input[aria-label="Busca"]')
      campo_busca.set @descricao
      campo_busca.send_keys(:enter)

      resultado_ok = page.has_css?('#searchResultLeftNav')
      
      if (resultado_ok)
          itens = page.all('button', exact_text: "Comprar")
          itens[0].click 
          acs = page.all('[id*="acessórios"]')
          acs[0].click
          crr = page.all('[id*="carrinho"]')
          crr[0].click
          fim = page.all('button[class*="continueButton"]', exact_text: "Finalizar")
          fim[0].click

          sleep 2
          if (page.has_css?('[id$="TaxIdPrimary"]'))
            find('[id$="TaxIdPrimary"]').set @cpf
          end

          if (page.has_css?('[id$="PostalCode"]'))
            find('[id$="PostalCode"]').set @cep
            o = find('input[id$="Line2"]')
            o.click
            o.set @numero
            find('[id$="AreaCode"]').set @cod
            find('[id$="PhoneNumber"]').set @telefone
          end
          
          sleep 2
          find('#continueButton').click
          sleep 5
          if(page.has_css?('[class*="payment-item-label"]', exact_text: "Boleto Bancário"))
            find('[class*="payment-item-label"]', exact_text: "Boleto Bancário").click
            find('button[id=continueButton]').click
          end
          sleep 5
          find('#DataModel-AgreeTermsAndConditions').click
          # find('#continueButton', exact_text: "Enviar pedido").click
          sleep 60
        end
    
  end                                                                                
                                                                                     
  Então("devo visualizar o boleto gerado com valor do produto") do                   
         
  end                                                                                
                                                                                     
  Então("o produto deve ser armazenado na lista de compras realizadas") do           
         
  end                                                                                
                                                                                     