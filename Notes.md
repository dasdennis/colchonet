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