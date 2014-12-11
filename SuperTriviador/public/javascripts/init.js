$(function(){
    $('.partidas-list').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500
    });
    
    $('#chat-box').css({
        'height' : '250px',
        'overflow-y' : 'scroll'
    });
});
