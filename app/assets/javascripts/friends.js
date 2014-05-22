$(function() {
    $("a#invite_fb_friends").click(function() {
        FB.init ({
            appId: '634029143340254',
            cookie:true,
            statue: true,
            oauth: true

        });
        FB.ui({method: 'apprequests', message:'Hey I invite you to my app'  });
    });
});
