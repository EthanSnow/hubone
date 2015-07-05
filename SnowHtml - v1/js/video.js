(function(){
	alert("javascript start");
	var Ecanvas = document.getElementById('Ecanvas'),
		Econtext = Ecanvas.getContext('2d'),
		Evideo = document.getElementById('Evideo'),
		EvendorUrl = window.URL || window.webkitURL;
		
	navigator.getMedia = navigator.webkitGetUserMedia ||
						 navigator.getUserMedia ||
						 navigator.mozGetUserMedia ||
						 navigator.msGetUserMedia;
	
	navigator.getMedia({
		video: true,
		audio: false
	}, function(stream){
		Evideo.scr = vendorUrl.createObjsctURL(stream);
		console.log(stream);
		if(!video.scr){
			alert("empty");
		}
		Evideo.play();
	},function(error){
		//error occured
		alert("error");
	});
	alert("end");
})();