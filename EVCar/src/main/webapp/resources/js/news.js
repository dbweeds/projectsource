/**
 * news.jsp 페이지 나누기
 */
var pageNum = 1;
var order = 1;

function displayTime(timeVal) {
	console.log(timeVal);

	var today = new Date();

	var dateObj = new Date(timeVal);


	if (dateObj.getDate() == today.getDate()) { //댓글 단 날짜가 오늘이라면
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();

		return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
	} else {
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
	}
}



$("#sim").click(function() {
	order = 1;
	getList(pageNum, order); //정확도		
});

$("#recently").click(function() {
	order = 2;
	getList(pageNum, order); //최신순	
});


function getList(param, order) {
	console.log("전기차 api 호출");

	var page = param || 1;


	$.getJSON({
		url: "/news/news_data/" + page + "/" + order,
		success: function(data) {
			console.log(data);
			console.log("전체 게시물 수 : " + data.total);

			showReplyPage(data.total);


			var result = "";
			//<td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd HH:mm"/></td>
			$(data.items).each(
				function(idx, item) {
					result += "<tr>";
					result += "<td>";
					result += "<a href ='" + item.originallink + "' class='newsline'>"
						+ item.title + "</a></td>";
					result += "<td class='text-center'>" + displayTime(item.pubDate) + "</td></tr>";
					//result += "<td><fmt:formatDate value='"+item.pubDate+"' pattern='yyyy-MM-dd HH:mm:ss'/></td></tr>";

				});


			if (order == 1) {
				$("#sim").removeClass();
				$("#sim").addClass("btn btn-primary");

				$("#recently").removeClass();
				$("#recently").addClass("btn btn-outline-secondary");
			} else {
				$("#sim").removeClass();
				$("#sim").addClass("btn btn-outline-secondary");
				$("#recently").removeClass();
				$("#recently").addClass("btn btn-primary");
			}

			$(".newspaper").html(result);
		}
	})
}//getList end


function showReplyPage(total) {
	console.log("total: " + total);

	//마지막 페이지 계산
	var endPage = Math.ceil(pageNum / 10.0) * 10;
	//시작 페이지 계산
	var startPage = endPage - 9;
	//이전버튼
	var prev = startPage != 1;
	//다음버튼
	var next = false;

	if (endPage * 10 >= total) {
		endPage = Math.ceil(total / 10.0);
	}
	if (endPage * 10 < total) {
		next = true;
	}


	var str = "<ul class='pagination pull-right'>";
	if (prev) {
		str += "<li class='page-item'><a class='page-link' href='" + (startPage - 1) + "'>";
		str += "이전</a></li>";
	}else{
        str += "<li class='page-item'><a class='page-link' href='#'>";
        str += "이전</a></li>";
    }
	for (var i = startPage; i <= endPage; i++) {
		var active = pageNum == i ? "active" : "";
		str += "<li class='page-item " + active + "'>";
		str += "<a class='page-link' href='" + i + "'>" + i + "</a></li>";
	}
	if (next) {
		str += "<li class='page-item'><a class='page-link' href='" + (endPage + 1) + "'>";
		str += "다음</a></li>";
	}
	str += "</ul>";
	$(".panel-footer").html(str);
}



//댓글 페이지 나누기 번호 클릭시 동작

$(".panel-footer").on("click", "li a", function(e) {
	e.preventDefault();


	pageNum = $(this).attr("href");
	getList(pageNum, order);

})

$(".panel-footer").css("padding-left", "20%");













