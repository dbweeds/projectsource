/**
 * 
 */
function displayTime(timeVal) {
	console.log(timeVal);

	var today = new Date();

	var dateObj = new Date(timeVal);


	
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		return [mm].join('');
	
}

function displayTime2(timeVal) {
	console.log(timeVal);

	var today = new Date();

	var dateObj = new Date(timeVal);


	
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		return [dd].join('');
	
}

function getList(param, order) {
	console.log("전기차 api 호출");

	var page = param || 1;
	var order = 1;

	$.getJSON({
		url: "/news/news_data/" + page + "/" + order,
		success: function(data) {
			console.log(data);
			console.log("전체 게시물 수 : " + data.total);

			//showReplyPage(data.total);



			console.log(data.items[0].title);
			$("#indexNews1").html(data.items[0].title + "<br>");
			$("#indexNews2").html(data.items[1].title + "<br>");
			$("#indexNews3").html(data.items[2].title + "<br>");

			$("#newsLink1").html("<a href = '" + data.items[0].originallink + "'class='btn fables-second-text-color fables-main-hover-color p-0 font-15 border-0'> 읽으러 가기 <i class='fas fa-long-arrow-alt-right'></i></a >");
			$("#newsLink2").html("<a href = '" + data.items[1].originallink + "'class='btn fables-second-text-color fables-main-hover-color p-0 font-15 border-0'> 읽으러 가기 <i class='fas fa-long-arrow-alt-right'></i></a >");
			$("#newsLink3").html("<a href = '" + data.items[2].originallink + "'class='btn fables-second-text-color fables-main-hover-color p-0 font-15 border-0'> 읽으러 가기 <i class='fas fa-long-arrow-alt-right'></i></a >");
			//<td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd HH:mm"/></td>
			$("#newsmm1").html(displayTime2(data.items[0].pubDate));
			$("#newsdd1").html(month(displayTime(data.items[0].pubDate)));
			$("#newsmm2").html(displayTime2(data.items[1].pubDate));
			$("#newsdd2").html(month(displayTime(data.items[1].pubDate)));
			$("#newsmm3").html(displayTime2(data.items[2].pubDate));
			$("#newsdd3").html(month(displayTime(data.items[2].pubDate)));
			/*$(data.items).each(
				function(idx, item) {
					if(idx<3){
					result += "<tr>";
					result += "<td>";
					result += "<a href ='" + item.originallink + "' class='newsline'>"
						+ item.title + "</a></td>";
					result += "<td class='text-center'>" + displayTime(item.pubDate) + "</td></tr>";
					//result += "<td><fmt:formatDate value='"+item.pubDate+"' pattern='yyyy-MM-dd HH:mm:ss'/></td></tr>";
					}
				});*/
		}
	})

}//getList end
function month(m){
	if(m == 1){		
		return "January";
	}else if(m == 2){
		return "February";	
	}else if(m == 3){
		return "March";	
	}else if(m == 4){
		return "April";
	}else if(m == 5){
		return "May";
	}else if(m == 6){
		return "June";	
	}else if(m == 7){
		return "July";	
	}else if(m == 8){
		return "August";
	}else if(m == 9){
		return "September";	
	}else if(m == 10){
		return "October";
	}else if(m == 11){
		return "November";	
	}else if(m == 12){
		return "December";	
	}
}