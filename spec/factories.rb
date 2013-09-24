#encoding: utf-8

FactoryGirl.define do 
  factory :user do
    name 'Diego Oliveira'
    email 'diego@email.com'
    nick 'diego1'
    plain_password '123456' 
    born_at '2013-05-04'
    situation 'on'
    hobby 'sei la'
    admin false
    moderator false
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
    moderator true
   end
   
   factory :history do
     historytype '1'
     title 'Branca de Neve'
     description 'Uma garota, bla bla bla'
     note 'bla bla bla'
     ahistory 'era uma vez...'
     classification_id 1
     user_id '11'
     moderate '0'
   end
   
   factory :moderated_history, class: History do
     title 'Chapeuzinho Vermelho'
     description 'Uma garota, bla bla bla, o lobo bla bla bla a véia bla bla bla'
     note 'bla bla bla'
     ahistory 'era uma vez...'
     classification_id 1
     historytype '1'
     user_id '11'
     moderate '2'
   end

   factory :refused_history, class: History do
     title 'Chapeuzinho Vermelho'
     description 'Uma garota, bla bla bla, o lobo bla bla bla a véia bla bla bla'
     note 'bla bla bla'
     ahistory 'era uma vez...'
     classification_id 1
     historytype '1'
     user_id '11'
     moderate '3'
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
     id 1
     min_age 10
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
