/**
 * 
비밀번호는 4~8 - 숫자만 허용
이름 : 2~4자리 허용
성별 : 무조건 하나 선택
이메일 : 이메일 검증


 */
$(function(){
	$("#form").validate({
		rules:{
			password:{
                required : true,
                validPw : true,
				rangelength:[4,8]
            },
			title:{
                required : true,
				rangelength:[2,30]
            },
			writer:{
				required : true,
				rangelength:[1,8]
			},
			content:{
				required : true,
				rangelength:[10, 1000]
			}
		},
		messages:{
			password:{
                required : "비밀번호는 필수입력란입니다."
            },
			title:{
                required : "제목은 필수입력란입니다.",
				rangelength: "제목은 최소2자부터 30자까지 입력가능합니다."
            },
			writer:{
				required : "작성자는 필수입력란입니다.",
				rangelength: "작성자는 최소1자에서 최대8자까지 입력가능합니다."
			},
			content:{
				required : "내용은 필수입력란입니다.",
				rangelength: "내용은 최소10자에서 최대1000자까지 입력가능합니다."
			}
		}/*,
		//errElement:"em", closest(현재 위치의 위로 가장가까운 "위치"를 찾는것),
        errorPlacement : function(error,element){
        	element.closest("form")
					.find("small[id='"+element.attr('id')+"']")
					.append(error);   
        },
		success: function(label){
			var name = label.attr('for');
			label.text(name+' is ok!');
		}*/
	});
})
$.validator.addMethod("validPw",function(value){
	var reg = /^[0-9]*$/;
	return reg.test(value);
},"비밀번호를 숫자 4~8로 작성해주세요.")
/*$(function() {
		var check = ${passwordCheck};
		if(!check){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
	})*/