var v;
var myselect;
var i = 10;

function change1() {
	myselect = document.getElementById("selectOpt01");
	v = myselect.options[myselect.selectedIndex].value;
	change();
}

function selectOpt(val) {
	var k = val;
	while (k < i) {
		if (typeof k !== 'undefined' && k !== null) {
			document.getElementById("div-" + k).style.display = 'none';
			k++;
		}
	}

	myselect = document.getElementById("selectOpt" + val);
	myselect.setAttribute("id", "selectOpt" + i);
	myselect.setAttribute("onchange", "selectOpt(" + i + ")");
	myselect = document.getElementById("selectOpt" + i);
	v = myselect.options[myselect.selectedIndex].value;
	change();
}

function change() {
	var xmlhttp;
	var iDiv = document.createElement('div');
	iDiv.id = 'div-' + i;
	document.getElementsByTagName('body')[0].appendChild(iDiv);
	i++
	var url = "ajaxHelp.jsp?aa=" + v;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById('div-' + (i - 1)).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
}

function myFunction() {
	location.reload(true);
}