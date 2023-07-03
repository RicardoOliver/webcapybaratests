Quando('insiro o email') do
  user_page.load
  user_page.preencher_email
  sleep 5  # Aguarda 3 segundos
end

Então('eu devo clicar no botão create an account') do
  user_page.clickBtn
  sleep 5 # Aguarda 3 segundos
end
