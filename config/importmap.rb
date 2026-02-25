# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tailwindcss" # @4.2.0
pin "@tailwindcss/forms", to: "@tailwindcss--forms.js" # @0.5.7
pin "mini-svg-data-uri" # @1.4.4
pin "tailwindcss/colors", to: "tailwindcss--colors.js" # @4.2.0
pin "tailwindcss/defaultTheme", to: "tailwindcss--defaultTheme.js" # @4.2.0
pin "tailwindcss/plugin", to: "tailwindcss--plugin.js" # @4.2.0
