import "bootstrap";
import { searchfct, searchAuthor } from '../search/search'
import { range_init} from '../notations/notes'
import { definehidden, togglebtn } from '../books/definehidden'
import { test, like } from '../ajax/tags'
import { displaycomment} from '../consultations/commentaires.js'
import { admin_delete, listeAdd} from '../admin/admin.js'
searchfct()
searchAuthor()
range_init()
test()
definehidden()
togglebtn()
displaycomment()
like()
admin_delete()
listeAdd()




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
