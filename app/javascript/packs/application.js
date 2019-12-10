import "bootstrap";
import { searchfct } from '../search/search'
import { range_init} from '../notations/notes'
import { definehidden, togglebtn } from '../books/definehidden'
import { test } from '../ajax/tags'
import { displaycomment} from '../consultations/commentaires.js'
searchfct()
range_init()
test()
definehidden()
togglebtn()
displaycomment()



$(document).ready(function () {


    setTimeout(function () {
        $('.fly-in-text').removeClass('hidden')
    }, 500)
    $('.contain-id').animate({
        opacity: 1
    }, 6000)


    setTimeout(function () {
        $('.fly-in-text li').eq(2).css('color', '#da541d');
    }, 2500)
    setTimeout(function () {
        $('.webdev').animate({
            top: '60%',
            opacity: 1
        }, 1600)
    }, 2500)


    setTimeout(function () {
        $('.gobtn').animate({
            opacity : 1
        },1000)

    },5000)


})
