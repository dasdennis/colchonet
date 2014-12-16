{
"authenticity_token"=>"ofiNLJQUjL/p5vX8z0cy+N5aE9htJDIAUk=",

"user"=> {
            "full_name"=>"Vinicius",
            "location"=>"San Francisco, CA",
            "email"=>"vinibaggio@example.com",
            "password"=>"segredo",
            "password_confirmation"=>"segredo",
            "bio"=>"Olá, tudo bom? Meu nome é Vinícius."
          },
            "commit"=>"Create User",
            "action"=>"create",
            "controller"=>"users"
}




Para o erro "ActiveModel::ForbiddenAttributesError in UsersController#create"

No metodo create, usei adicionei params.permit! conforme  http://api.rubyonrails.org/classes/ActiveModel/ForbiddenAttributesError.html

Raised when forbidden attributes are used for mass assignment.

class Person < ActiveRecord::Base
end

params = ActionController::Parameters.new(name: 'Bob')
Person.new(params)
# => ActiveModel::ForbiddenAttributesError

params.permit!
Person.new(params)
# => #<Person id: nil, name: "Bob">


en:
  users:
    new:
      title: Register
    edit:
      title: Editar Perfil
    show:
      title: "Perfil: %{user_name}"
      edit: 'Editar Perfil'
      location: "Localização: %{location}"
      bio: "Bio: %{bio}"
  links:
    back: Voltar    
  
  layout:
    rooms: Rooms
    signup: Register

  general:
    form_error: Há erros no formulário, por favor verifique.

  activerecord:
    models:
      user: Usuário
      room: Quarto

    attributes:
      user:
        bio: Biografia
        email: Email
        full_name: Nome completo
        location: Localização
        password: Senha
        password_confirmation: Confirme sua senha
      room:
        description: Descrição
        location: Localização
        title: Título