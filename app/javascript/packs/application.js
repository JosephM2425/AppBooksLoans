import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// document.addEventListener('click', function(e){
//     if(e.target.matches('#switchTheme')){
//         e.preventDefault()
//         fetch(, {
//             method: 'PUT',
//             headers: {
//                 'Accept': 'application/json',
//                 'Content-Type': 'application/json',
//                 "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
//             },
//         })
//     }
// })