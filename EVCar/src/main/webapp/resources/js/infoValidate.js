/**
 * 
 */
$(function(){
	$("#form").validate({
		rules:{
			carname:{
                required : true,
                validCarname : true
			},
			carname_en:{
                required : true,
                validCarEnName : true
			},
			title:{
                required : true,
				rangelength:[1,100]
            },
			content:{
				required : true,
				rangelength:[1, 800]
			},
			brand:{
				required : true,
			},
			releasedate:{
				required : true,
				rangelength:[4,4]
			},
			cartype:{
				required : true,
			},
			fuel:{
				required : true,
			},
			mileage:{
				required : true,
			},
			chargetype:{
				required : true,
			},
			rowprice:{
				required : true,
			},
			highprice:{
				required : true,
			},
			reviewtitle1:{
				required : true,
				rangelength:[1, 50]
			},
			review1:{
				required : true,
				rangelength:[1, 1000]
			}
		},
		messages:{
			carname:{
                required : "차량 이름을 입력해주세요."
            },
            carname_en:{
                required : "차량 영어 이름을 입력해주세요."
            },
            title:{
                required : "제목을 입력해주세요.",
                rangelength:"최대 100자 이내로 입력하세요."
            },
            content:{
                required : "내용을 입력해주세요.",
                rangelength:"최대 800자 이내로 입력하세요."
            },
            brand:{
                required : "제조사를 선택해주세요.",
            },
            releasedate:{
                required : "출시일을 입력해 주세요.",
                rangelength:"출시일을 잘 확인해주세요."
            },
            cartype:{
                required : "차종을 선택해주세요.",
            },
            fuel:{
                required : "연비를 입력해주세요.",
            },
            mileage:{
                required : "주행거리를 입력해주세요.",
            },
            chargetype:{
                required : "충전방식을 선택해주세요.",
            },
            rowprice:{
                required : "최저가격을 입력해주세요.",
            },
            highprice:{
                required : "최고가격을 입력해주세요.",
            },
            reviewtitle1:{
                required : "리뷰 제목을 입력해주세요.",
                rangelength:"최대 50자 이내로 입력해주세요."
            },
            review1:{
                required : "리뷰 내용을 입력해주세요.",
                rangelength:"최대 1000자 이내로 입력해주세요."
            }
            
		}
	});
})
$.validator.addMethod("validCarname",function(value){
	var reg =  /^[ㄱ-ㅎ가-힣\d-]+$/;
	return reg.test(value);
},"한글과 숫자,- 만 입력해주세요.");
$.validator.addMethod("validCarEnName",function(value){
	var reg = /^[a-zA-Z\d-]+$/;
	return reg.test(value);
},"영어와 숫자,- 만 입력해주세요.");
