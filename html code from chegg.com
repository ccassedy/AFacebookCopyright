<!DOCTYPE html>
<!-- saved from url=(0075)https://sr.rlcdn.com/448926.html?s=576f1813dc2a3ea1d1b140239a4f81bfc83887b6 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252"><meta name="referrer" content="no-referrer"><script>
		var f = function () {
	function loadChains(chains, limit, onChainDone) {
    function newImageLoader(url) {
        return function () {
            var e = new Image();
            addListeners(e);
            e.src = url;
        };
    }

    function newScriptLoader(url) {
        return function () {
            var e = document.createElement('script');
            e.type = 'text/javascript';
            e.async = true;
            addListeners(e);
            e.src = url;
            document.head.appendChild(e);
        };
    }

    function newIframeLoader(url) {
        return function () {
            var e = document.createElement('iframe');
            e.style.display = 'none';
            e.width = 1;
            e.height = 1;
            addListeners(e);
            e.src = url;
            document.body.appendChild(e);
        };
    }

    function addListeners(e) {
        addLoadErrorListeners(e, loadNext);
        if (typeof onChainDone === 'function') {
            addLoadErrorListeners(e, onChainDone);
        }
    }

    function addLoadErrorListeners(e, listener) {
        if (typeof e.addEventListener === 'function') {
            e.addEventListener('load', listener, false);
            e.addEventListener('error', listener, false);
        } else if (typeof e.attachEvent === 'function') {
            e.attachEvent('onload', listener);
            e.attachEvent('onerror', listener);
        }
    }

    function loadNext() {
        var next = loaders.shift();
        if (typeof next === "function") {
            setTimeout(next);
        }
    }

    var loaders = chains.reduce(function (acc, value) {
        var mode = value[0];
        var url = value[1];

        switch (mode) {
            case 'image':
                acc.push(newImageLoader(url));
                break;
            case 'script':
                acc.push(newScriptLoader(url));
                break;
            case 'iframe':
                acc.push(newIframeLoader(url));
                break;
        }
        return acc;
    }, []);

    for (var i = 0; i < limit; i++) {
        loadNext();
    }
}

	var chains = [];
	chains.push(['image', 'https://sr.rlcdn.com/1000.gif?memo=CJ6zGxI0Ci4IBBAAGig1NzZmMTgxM2RjMmEzZWExZDFiMTQwMjM5YTRmODFiZmM4Mzg4N2I2EK7xBBoVCPe_0fYFEgUI6AcQABIGCLrqARAAQgBKAA']);
	chains.push(['image', 'https://cm.g.doubleclick.net/pixel?google_nid=liveramp&google_cm']);

	loadChains(chains, 10, (typeof onDone === "function") ? onDone : null);
		};

		if (document.body) { f(); } else { document.addEventListener('DOMContentLoaded', f); }
	</script>
</head><body></body></html>
