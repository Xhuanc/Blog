!function (e) {
    var t, n, o, c, i,
        d = '<svg><symbol id="icon-yanzhengma" viewBox="0 0 1024 1024"><path d="M535.912619 487.919559 535.912619 335.071382l103.370299 0c11.04659 0 19.999496-8.952906 19.999496-19.999496 0-11.04659-8.952906-19.999496-19.999496-19.999496L535.912619 295.072389 535.912619 183.078689l103.370299 0c11.04659 0 19.999496-8.952906 19.999496-19.999496 0-11.04659-8.952906-19.999496-19.999496-19.999496L535.912619 143.079696 535.912619 91.082438c0-11.04659-8.952906-19.999496-19.999496-19.999496-11.04659 0-19.999496 8.952906-19.999496 19.999496l0 396.83712c-120.800273 10.18599-215.989239 111.74299-215.989239 235.133252 0 130.126686 105.86205 235.988736 235.988736 235.988736s235.988736-105.86205 235.988736-235.988736C751.901859 599.662549 656.712893 498.105548 535.912619 487.919559zM515.913123 919.042553c-108.073414 0-195.990766-87.917352-195.990766-195.990766 0-108.069321 87.917352-195.990766 195.990766-195.990766s195.990766 87.921445 195.990766 195.990766C711.903889 831.125201 623.986537 919.042553 515.913123 919.042553z"  ></path></symbol><symbol id="icon-zhanghao" viewBox="0 0 1024 1024"><path d="M828.1 722.4c-17.3-40.9-42-77.5-73.5-109s-68.2-56.2-109.1-73.5c-10.2-4.3-20.6-8.1-31-11.4 54.5-34.7 90.8-95.7 90.8-164.9 0-107.7-87.6-195.4-195.4-195.4-107.7 0-195.4 87.6-195.4 195.4 0 69.9 36.9 131.3 92.2 165.8-9.6 3.1-19 6.6-28.3 10.5-40.9 17.3-77.5 42-109 73.5s-56.2 68.2-73.5 109c-17.9 42.3-27 87.2-27 133.6h46c0-163.8 133.3-297.1 297.1-297.1S809.1 692.2 809.1 856h46c0-46.4-9.1-91.3-27-133.6zM360.6 363.5c0-82.4 67-149.4 149.4-149.4s149.4 67 149.4 149.4-67 149.4-149.4 149.4c-82.4-0.1-149.4-67.1-149.4-149.4z"  ></path></symbol><symbol id="icon-mima" viewBox="0 0 1024 1024"><path d="M288 384v-74.666667c0-123.722667 100.266667-224 224-224s224 100.224 224 224v74.666667h10.677333C811.445333 384 864 436.597333 864 501.333333v320c0 64.821333-52.469333 117.333333-117.322667 117.333334H277.333333C212.554667 938.666667 160 886.069333 160 821.333333V501.333333c0-64.821333 52.469333-117.333333 117.322667-117.333333H288z m64 0h320v-74.666667c0-88.426667-71.605333-160-160-160-88.384 0-160 71.626667-160 160v74.666667zM224 501.333333v320c0 29.397333 23.914667 53.333333 53.322667 53.333334H746.666667A53.269333 53.269333 0 0 0 800 821.333333V501.333333c0-29.397333-23.914667-53.333333-53.322667-53.333333H277.333333A53.269333 53.269333 0 0 0 224 501.333333z"  ></path></symbol></svg>',
        s = (s = document.getElementsByTagName("script"))[s.length - 1].getAttribute("data-injectcss"),
        a = function (e, t) {
            t.parentNode.insertBefore(e, t)
        };
    if (s && !e.__iconfont__svg__cssinject__) {
        e.__iconfont__svg__cssinject__ = !0;
        try {
            document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>")
        } catch (e) {
            console && console.log(e)
        }
    }

    function l() {
        i || (i = !0, o())
    }

    function m() {
        try {
            c.documentElement.doScroll("left")
        } catch (e) {
            return void setTimeout(m, 50)
        }
        l()
    }

    t = function () {
        var e, t;
        (t = document.createElement("div")).innerHTML = d, d = null, (e = t.getElementsByTagName("svg")[0]) && (e.setAttribute("aria-hidden", "true"), e.style.position = "absolute", e.style.width = 0, e.style.height = 0, e.style.overflow = "hidden", t = e, (e = document.body).firstChild ? a(t, e.firstChild) : e.appendChild(t))
    }, document.addEventListener ? ~["complete", "loaded", "interactive"].indexOf(document.readyState) ? setTimeout(t, 0) : (n = function () {
        document.removeEventListener("DOMContentLoaded", n, !1), t()
    }, document.addEventListener("DOMContentLoaded", n, !1)) : document.attachEvent && (o = t, c = e.document, i = !1, m(), c.onreadystatechange = function () {
        "complete" == c.readyState && (c.onreadystatechange = null, l())
    })
}(window);