Testapp::Application.routes.draw do
  resources :publishers do
    resources :books
  end

  resources :books

  resources :shops do
    resources :books
  end
  
  root to: 'publishers#index'
end
