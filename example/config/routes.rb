Example::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resource :form

  root to: redirect('/form/')
end
