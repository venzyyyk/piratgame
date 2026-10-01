var ACCOUNTS={'henger':'test12345','admin':'admin123','pirat':'pirat123'};
function doLogin(n,p){if(ACCOUNTS[n]&&ACCOUNTS[n]===p){localStorage.setItem('sw_user',n);localStorage.setItem('sw_logged','1');window.location.href='city.html';return true}return false}
function doRegister(n,p){localStorage.setItem('sw_user',n);localStorage.setItem('sw_logged','1');window.location.href='city.html'}
function doLogout(){localStorage.removeItem('sw_user');localStorage.removeItem('sw_logged');window.location.href='index.html'}
function requireAuth(){if(localStorage.getItem('sw_logged')!=='1'){window.location.href='auth.html';return false}return true}
function getUser(){return localStorage.getItem('sw_user')||'pirat'}
