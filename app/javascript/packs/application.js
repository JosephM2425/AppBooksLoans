import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import Chartkick from 'chartkick'
import Highcharts from 'highcharts'
window.Highcharts = Highcharts

import index from '../src/index'
import destroy from '../src/destroy'



document.addEventListener("turbolinks:load", function() {
    index()
    // document.addEventListener('click', function(e){
    //     if(e.target.matches('.author_refresh')){
    //         e.preventDefault()
    //         index(e)
    //     }
    // })

    document.addEventListener('click', function(e){
        if(e.target.matches('.author_delete')){
            e.preventDefault()
            destroy(e)
        }
    })

});
