Warp2bizInventory::Application.routes.draw do
  resources :hardwares
  
  get 'hardwares/page/:page' => 'hardwares#index'

  root to: 'hardwares#index'
end
