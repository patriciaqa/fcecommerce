class CompraPage < Base

    def consultar_produto (produto)
        campo_busca = find('input[aria-label="Busca"]')
        campo_busca.set produto
        campo_busca.send_keys(:enter)
    end

    def resultado_consulta()
        page.has_css?('#searchResultLeftNav')
    end

    def comprar_produto(cpf, cep, numero, cod, telefone)
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
            find('[id$="TaxIdPrimary"]').set cpf
          end

          if (page.has_css?('[id$="PostalCode"]'))
            find('[id$="PostalCode"]').set cep
            o = find('input[id$="Line2"]')
            o.click
            o.set numero
            find('[id$="AreaCode"]').set cod
            find('[id$="PhoneNumber"]').set telefone
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
    end
end