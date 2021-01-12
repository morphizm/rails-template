# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'web/welcome#show'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get '*path', to: 'web/welcome#show'
end
