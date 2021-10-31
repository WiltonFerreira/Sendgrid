# Sendgrid webhook


Esta aplicação foi desenvolvida com o intuito de capturar informações do processamento dos emails enviados ao sendgrid. Estas **informações** só ficam disponíveis na plataforma por um certo período de tempo e são apagadas posteriormente.


## Requisitos
* Redis 4.0 ou Superior (docker run redis)
* Sidekiq (gem)
* Banco de dados PostgreSQL 


## Jobs
Permite a aplicação trabalhar de forma assíncrona, enfileirando as informações e posteriormente gravando em disco, liberando o pool para que possa atender uma demanda alta de requisições.

Foi utilizado o sidekiq - worker, ao invés do activejob.

## Multiplos monitoramentos

Através da chamada do controller, em [routes.rb], será possível gravar informação de mais de uma conta do sendgrid. 

```
POST http://app-webhook/receiver/<monitoramento>/ <json>
[monitoramento] = nome da identificação que será armazenda com todos os registros.
```
Exemplo de teste:

```
curl -X POST -H "Content-Type: application/json" -d '[{"email":"john.doe@sendgrid.com","timestamp":1337197600,"smtp-id":"<4FB4041F.6080505@sendgrid.com>","event":"processed"},{"email":"john.doe@sendgrid.com","timestamp":1337966815,"category":"newuser","event":"click","url":"https://sendgrid.com"},{"email":"john.doe@sendgrid.com","timestamp":1337969592,"smtp-id":"<20120525181309.C1A9B40405B3@Example-Mac.local>","event":"processed"}]' 
http://app-webhook/receiver/identificador
```
 
## Tech
* Ruby 2.6.6
* Rails 6.1.4.1
* Capistrano [deploy]

## Referências
* App sendgrid - https://github.com/sendgrid/eventkit-rails
* API - https://docs.sendgrid.com/for-developers/tracking-events/event
* Blog - https://sendgrid.com/blog/tutorial-event-notification-app-event-webhook/ explica os eventos de campanha e eventos de sinalização.
