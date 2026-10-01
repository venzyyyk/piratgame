function updateClock(){var n=new Date(),h=n.getHours(),m=n.getMinutes(),e=document.getElementById('clock');if(e)e.textContent=(h<10?'0':'')+h+':'+(m<10?'0':'')+m}
updateClock();setInterval(updateClock,10000);
(function(){var e=document.getElementById('online-count');if(!e)return;var c=20+Math.floor(Math.random()*15);e.textContent=c;setInterval(function(){c=Math.max(8,Math.min(55,c+(Math.random()>0.5?1:-1)));e.textContent=c},3000+Math.random()*5000)})();
(function(){var e=document.getElementById('gen-time');if(!e)return;e.textContent='# '+(0.001+Math.random()*0.003).toFixed(5)+' s.'})();
