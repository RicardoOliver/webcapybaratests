class UserPage < SitePrism::Page
    set_url 'index.php?controller=authentication&back=my-account'
    element :email, '#email_create'
    element :btnCreate, '#SubmitCreate'
  
    def preencher_email
      email.set Faker::Internet.email
    end
  
    def clickBtn
      btnCreate.click
    end
  end
  