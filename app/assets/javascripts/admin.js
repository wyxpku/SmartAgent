var myjson;
	function c()
	{
		$.ajax({
			type :"post",
			url : "./myadmin",
			dataType : "json",
			data : {
				mode:1,
			},
			success : function(){
				alert("success");
				
			},
			error : function(json){
				alert("网络错误");
			}
			
		});
	}
	function loadUser()
	{
		
		
	}
	
