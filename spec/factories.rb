FactoryGirl.define do 
  factory :user do
    name 'Diego Oliveira'
    email 'diego@email.com'
    nick 'diego1'
    password '123456' 
    born_at '2013-05-04'
    situation 'on'
    hobby 'sei la'
    admin false
   end

   factory :admin, class: User do
    name 'Treicy Felton'
    email 'treicy@email.com'
    nick 'treicy'
    password '123456' 
    born_at '2013-05-04'
    situation 'on'
    hobby 'sei la'
    admin true
   end
   
   factory :history do
     title 'Branca de Neve'
     description 'Uma garota, bla bla bla'
     classification 'Livre'
     note 'bla bla bla'
     ahistory 'era uma vez...'
   end

   factory :category do
     addcategory 'Aventura'
   end

   factory :rule do
     uprules 'Regra bla bla bla, nao pode isso, nao pode aquilo.'
   end

   factory :contact do
     ctype 'Sugestao'
     subject 'Novo recurso para o site'
     cemail 'myemail@email.com'
     link 'site.com.br/pagina-tal'
     message 'Nessa pagina podia ter isso, isso e aquilo.'
   end

   factory :classification do
     min_age '10'
     name '10 anos'
   end

   factory :favorite do
     history_id '26'
     user_id '11'
   end

   factory :rate do
     history_id '26'
     urate '5'
     user_id '11'
     owner '12'
   end

end
