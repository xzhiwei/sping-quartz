
function openAddJobWindow(){
	var x = window.screen.height;
	var y = window.screen.width;
	var h = 500;
	var w = 800;
	var model = "title=word,resizable=yes,scrollbars=yes,height=" + h + ",width=" + w + ",status=yes,toolbar=no,menubar=no,location=no,top=" + (x-h)/2 + ",left=" + (y-w)/2;
	var url = "";
	url = "addJob";//弹出窗口的页面内容
	var oOpen = window.open(url,"Add Job",model);
	oOpen.focus();
}

