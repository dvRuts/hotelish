ActiveAdmin.register PaymentMethod do
  menu parent: 'Configurações', priority: 3

  config.create_another = true

  index do
    column :name
    actions
  end

  form do |f|
    inputs do
      f.input :name
    end

    actions
  end

  permit_params :name
end
