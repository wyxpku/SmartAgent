$(document).ready(function(){
	
	
	$(".startapp").mouseenter(function(){
		  $(this).grumble({
				text: '开启/关闭应用', 
				angle: 45, 
				distance: 35, 
				showAfter: 100,
				hideAfter: 500
			});
		});
	$(".shareapp").mouseenter(function(){
		  $(this).grumble({
				text: '分享应用', 
				angle: 45, 
				distance: 35, 
				showAfter: 100,
				hideAfter: 500
			});
		});
	$(".editapp").mouseenter(function(){
		  $(this).grumble({
				text: '编辑应用', 
				angle: 45, 
				distance: 35, 
				showAfter: 100,
				hideAfter: 500
			});
		});
	
	
})
