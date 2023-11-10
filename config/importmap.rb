# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.0/modular/sortable.esm.js"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js", preload: true
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.8/lib/index.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
