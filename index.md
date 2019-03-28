---
title: Home
---

<p>
    <span>$</span><span style="visibility:hidden;" id="cursor">▮</span>
</p>

<style>
    p {
        font-size: 25px;
        color: #00FF66;
        margin-block-end: 0.1em;
        margin-block-start: 0.1em;
        margin-top: -0.5em;
    }

    #cursor {
        font-size: 29px;
    }

    html {
        overflow: scroll;
        overflow-x: hidden;
        scrollbar-width: none;
        -ms-overflow-style: none;
    }

    ::-webkit-scrollbar {
        width: 0px; 
        background: transparent;
    }

    ::-webkit-scrollbar-thumb {
        background: #00FF66;
    }
</style>

<script>
    var i = 0;
    window.setInterval(function(){
        document.getElementById("cursor").style.visibility=(i++&1)?"hidden":"visible";
    },1000);
</script>
