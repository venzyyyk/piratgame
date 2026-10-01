// Set username across game pages
(function(){var u=(typeof getUser==='function')?getUser():'pirat';document.querySelectorAll('#username').forEach(function(e){e.textContent=u});var ui=document.getElementById('username');if(ui)ui.textContent=u;})();
// Real clock with seconds (top bar)
(function(){var els=document.querySelectorAll('.realclock');if(!els.length)return;function t(){var n=new Date();var s=String(n.getHours()).padStart(2,'0')+':'+String(n.getMinutes()).padStart(2,'0')+':'+String(n.getSeconds()).padStart(2,'0');els.forEach(function(e){e.textContent=s})}t();setInterval(t,1000)})();
// Inline online count (comuni "Кто онлайн")
(function(){var e=document.getElementById('online-inline');if(!e)return;var c=27;setInterval(function(){c=Math.max(15,Math.min(40,c+(Math.random()>0.5?1:-1)));e.textContent=c},8000)})();
