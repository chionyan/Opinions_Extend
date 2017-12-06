Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'


  get 'question_masters/radionew', to: 'question_masters#radionew', as: 'radionew'
  post 'question_masters/radiocreate', to: 'question_masters#radiocreate', as: 'radiocreate'
  
  get 'question_masters/checknew', to: 'question_masters#checknew', as: 'checknew'
  post 'question_masters/checkcreate', to: 'question_masters#checkcreate', as: 'checkcreate'
  
  get 'question_masters/textnew', to: 'question_masters#textnew', as: 'textnew'
  post 'question_masters/textcreate', to: 'question_masters#textcreate', as: 'textcreate'
  delete 'question_masters/textdelete', to: 'question_masters#textdelete', as: 'textdelete'
  
  post 'answers/:id/new', to: 'answers#create', as: 'answers'
  get 'answers/:id/new', to: 'answers#new', as: 'answer'
  get 'answers/:id/textnew', to: 'answers#textnew', as: 'textnew_a'
  #post 'answers/textcreate', to: 'answers#textcreate', as: 'textcreate_a'
  #delete 'answers/textdelete', to: 'answers#textdelete', as: 'textdelete_a'
  get 'answers/:id/radionew', to: 'answers#radionew', as: 'radionew_a'
  get 'answers/:id/checknew', to: 'answers#checknew', as: 'checknew_a'
  
  resources :users, only: [:show, :new, :create]
  resources :question_masters, only: [:new, :create, :destroy,:show]
  #resources :answers, only: [:new, :create, :destroy]
end
