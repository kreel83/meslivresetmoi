$(document).ready(function () {


    setTimeout(function () {
        $('.fly-in-text').removeClass('hidden')
    }, 500)
    $('.contain-id').animate({
        opacity: 1
    }, 6000)
    setTimeout(function () {
        $('.fly-in-text li').eq(2).transition({
            perspective: '100px',
            rotateY: '180deg',
            duration: '2.5s'
        });
    }, 2500)

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
        $('.webdev').animate({

            opacity: 0
        }, 1600)
    }, 4000)

    setTimeout(function () {
        $('.fly-in-text').animate({
            opacity: 0
        }, 1600)
    }, 4000)

    setTimeout(function () {
        $('.fly-in-text').add('hidden')
    }, 500)






    },5500)


})

