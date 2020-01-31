#language: pt

Funcionalidade: Comprar produto via boleto
            Para que eu possa comprar um produto no e-commerce
            Sendo um usuário cadastrado 
            Posso realizar pagamento via boleto


@autenticado    			
Cenário: Compra com sucesso 

    Dado as seguintes informações do usuário:
      | cpf         | 87454986013 |
      | cep         | 01415906    |
      | numero      | 999         |
      | codigo_area | 11          |
      | telefone    | 32409897    |
    E quer comprar o produto "notebook dell i5 15"
    Quando compra o produto via boleto
    Então devo visualizar o boleto gerado com valor do produto